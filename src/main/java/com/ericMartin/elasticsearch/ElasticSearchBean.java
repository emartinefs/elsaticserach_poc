package com.ericMartin.elasticsearch;

import static org.elasticsearch.index.query.QueryBuilders.fieldQuery;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.search.SearchHit;

import com.ericMartin.domain.Person;

public class ElasticSearchBean {

	
    private Person selectPerson;
    private Person person            = new Person();
    private List<Person>  personList = new ArrayList<Person>();

    private static final String INDEX_NAME = "ericmartin";
    private static final String TYPE_NAME  = "person";

    private String wildCardQuery;

    public ElasticSearchBean() {
    	prepareDocumentList();
    }

   

   
    public void prepareDocumentList(){

        wildCardQuery = "";
        ClientProvider.instance().prepareClient();
        ClientProvider.instance().getClient()
                .admin().indices().prepareRefresh().execute().actionGet();

        
    }

    public static Map<String, Object> putJsonDocument(Integer personId, String firstName, String lastName, String company, String department, String title, String ssn, String dob){

        Map<String, Object> jsonDocument = new HashMap<String, Object>();

        try {
            
        	jsonDocument.put("personId", personId);
            jsonDocument.put("firstName", firstName);
            jsonDocument.put("lastName", lastName);
            jsonDocument.put("company", company);
            jsonDocument.put("department", department);
            jsonDocument.put("title", title);
            jsonDocument.put("ssn", ssn);
            jsonDocument.put("dob", dob);
            
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return jsonDocument;
    }

    
    
    public void cleanUp() throws Exception {
    	ClientProvider.instance().closeNode();
  	}
    
    public static void saveData(Integer id, String firstName, String lastName, String company, String department, String title, String ssn, String dob)
    {
    	ClientProvider.instance().getClient().prepareIndex(INDEX_NAME, TYPE_NAME, id.toString())
          .setSource(putJsonDocument(id, firstName, lastName, company, department, title, ssn, dob)).execute().actionGet();
    }
    public static void updateData(Integer id, String firstName, String lastName, String company, String department, String title, String ssn, String dob)
    {    	
    	
    	 Map<String, Object> updateObject = new HashMap<String, Object>();

         updateObject.put("personId", id.toString());
         updateObject.put("firstName", firstName);
         updateObject.put("lastName",lastName);
         updateObject.put("company", company);         
         updateObject.put("department", department);
         updateObject.put("title", title);
         updateObject.put("ssn", ssn);
         updateObject.put("dob", dob);
        


         ClientProvider.instance().getClient().prepareUpdate(INDEX_NAME, TYPE_NAME, id.toString())
                 .setScript("ctx._source.personId=personId; ctx._source.firstName=firstName; "
                         + "ctx._source.lastName=lastName; ctx._source.company=company;ctx._source.department=department;ctx._source.title=title;ctx._source.ssn=ssn;ctx._source.dob=dob; ")
                 .setScriptParams(updateObject).execute().actionGet();
    }
    
    
    public static void deleteData(Integer id)
    {
    	    	
    	 DeleteResponse response = ClientProvider.instance().getClient().prepareDelete(INDEX_NAME, TYPE_NAME, id.toString()).execute().actionGet();
    }
    
    public static ArrayList<Person> findData(String field, String value)
    {
    	
    	
    	SearchResponse response = ClientProvider.instance().getClient().prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setSearchType(SearchType.QUERY_AND_FETCH)
                .setQuery(fieldQuery(field, value))
                .setFrom(0).setSize(60).setExplain(true)
                .execute()
                .actionGet();

    	Person temporary = null;
    	
    	
    	ArrayList<Person> personList = null;
    	
    	if (response != null) {

    		personList = new ArrayList<Person>();
            for (SearchHit hit : response.getHits()) {

                try {
                	
                    temporary = new Person();
                    temporary.setPersonId(Integer.parseInt(hit.getSource().get("personId").toString()));
                    temporary.setFirstName(hit.getSource().get("firstName").toString());
                    temporary.setLastName(hit.getSource().get("lastName").toString());
                    temporary.setCompany(hit.getSource().get("company").toString());
                    
                    temporary.setDepartment(hit.getSource().get("department").toString());
                    temporary.setTitle(hit.getSource().get("title").toString());
                    temporary.setSsn(hit.getSource().get("ssn").toString());
                    temporary.setDob(hit.getSource().get("dob").toString());
                  
                } catch (Exception e) {
                    e.printStackTrace();
                }
                personList.add(temporary);
            }
        }
    	
    	return personList;
    }
}
