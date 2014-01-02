package com.ericMartin.action;

import java.util.ArrayList;

import com.ericMartin.dao.PersonDao;
import com.ericMartin.domain.Person;
import com.ericMartin.elasticsearch.ElasticSearchBean;
import com.opensymphony.xwork2.ActionSupport;

public class SearchPersonPageAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private PersonDao personDao;
	private Person personData;
	private ArrayList<Person> personList;
	private Integer personId;
	
	private ElasticSearchBean searchBean;
	
	
	
	
	public ElasticSearchBean getSearchBean() {
		return searchBean;
	}


	public void setSearchBean(ElasticSearchBean searchBean) {
		this.searchBean = searchBean;
	}

	
	public PersonDao getPersonDao() {
		return personDao;
	}


	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}


	public Person getPersonData() {
		return personData;
	}


	public void setPersonData(Person personData) {
		this.personData = personData;
	}


	public ArrayList<Person> getPersonList() {
		//personList = (ArrayList<Person>)personDao.listPersonData();
		return personList;
	}


	public void setPersonList(ArrayList<Person> personList) {
		this.personList = personList;
	}


	public Integer getPersonId() {
		return personId;
	}


	public void setPersonId(Integer personId) {
		this.personId = personId;
	}


	public String execute() {
		personData = null;
		personId = null;
		
		return SUCCESS;
	}
	
	public String savePersonData()
	{
		if(personData != null)
			personDao.savePerson(personData);
		
		personData = null;
		
		return SUCCESS;
	}
	
	public String modifyPersonData()
	{
		if(personId != null)
			personData = personDao.listPerson(personId);
		return SUCCESS;
	}
	
	public String deletePersonData()
	{
		if(personId != null)
			personDao.deletePerson(personId);
		return SUCCESS;
	}
	
	public String searchPersonData()
	{
		if(personData != null)
		{
			if(personData.getFirstName() != null && !personData.getFirstName().equalsIgnoreCase(""))
				personList = searchBean.findData("firstName", personData.getFirstName());
			else if(personData.getLastName() != null && !personData.getLastName().equalsIgnoreCase(""))
				personList = searchBean.findData("lastName", personData.getLastName());
			else if(personData.getCompany() != null && !personData.getCompany().equalsIgnoreCase(""))
				personList = searchBean.findData("company", personData.getCompany());
			else if(personData.getDepartment() != null && !personData.getDepartment().equalsIgnoreCase(""))
				personList = searchBean.findData("department", personData.getDepartment());
			else if(personData.getTitle() != null && !personData.getTitle().equalsIgnoreCase(""))
				personList = searchBean.findData("title", personData.getTitle());
			else if(personData.getSsn() != null && !personData.getSsn().equalsIgnoreCase(""))
				personList = searchBean.findData("ssn", personData.getSsn());
			else
				personList = (ArrayList<Person>)personDao.listPersonData();
			
			
		}
		
		personData = null;
		
		return SUCCESS;
	}
	
}
