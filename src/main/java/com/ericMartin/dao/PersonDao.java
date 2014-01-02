package com.ericMartin.dao;

import java.util.List;

import com.ericMartin.domain.Person;

public interface PersonDao {
	public List<Person> listPersonData();
	public List<Person> listPersonData(String firstName, String lastName);
	public void savePerson(Person data);
	public Person listPerson(Integer personId);
	public void deletePerson(Integer personId);

}
