package com.ericMartin.action;

import java.util.ArrayList;

import com.ericMartin.dao.PersonDao;
import com.ericMartin.domain.Person;
import com.ericMartin.elasticsearch.ElasticSearchBean;
import com.opensymphony.xwork2.ActionSupport;

public class DeletePersonPageAction extends ActionSupport{

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
		personList = (ArrayList<Person>)personDao.listPersonData();
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
		{
			searchBean.deleteData(personId);
			personDao.deletePerson(personId);
		}
			
		return SUCCESS;
	}
	
	public String searchPersonData()
	{
		if(personData != null)
		{
			personList = (ArrayList<Person>)personDao.listPersonData(personData.getFirstName(), personData.getLastName());
		}
		
		personData = null;
		
		return SUCCESS;
	}
	
}
