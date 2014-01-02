package com.ericMartin.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.ericMartin.domain.Person;

public class PersonDaoImpl extends BaseDaoImpl implements PersonDao{

	@SuppressWarnings("unchecked")
	public List<Person> listPersonData() {
		return session.createQuery(" from Person ").list();
	}

	
	public void savePerson(Person data) {
		session.saveOrUpdate(data);
session.flush();

	}

	public Person listPerson(Integer personId) {
		
		return (Person)session.createCriteria(Person.class).add(Restrictions.eq("personId", personId.intValue())).list().get(0);
	}

	@Override
	public void deletePerson(Integer personId) {
		
		Person person = (Person)session.createCriteria(Person.class).add(Restrictions.eq("personId", personId.intValue())).list().get(0);
		session.delete(person);
		session.flush();
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersonData(String firstName, String lastName) {
		Criteria crt = session.createCriteria(Person.class);
		if(firstName != null && !firstName.equalsIgnoreCase(""))
			crt.add(Restrictions.eq("firstName", firstName));
		
		if(lastName != null && !lastName.equalsIgnoreCase(""))
			crt.add(Restrictions.eq("lastName", lastName));
		
		
		return crt.list();
	}

}
