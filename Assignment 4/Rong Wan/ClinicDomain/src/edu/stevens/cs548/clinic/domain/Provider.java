package edu.stevens.cs548.clinic.domain;

import static javax.persistence.CascadeType.REMOVE;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Providers
 *
 */
@Entity
@Table(name = "PROVIDER")

public class Provider implements Serializable {

	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private long id;
	
	private long npi;
	private String specialization;
	
	@OneToMany(mappedBy = "provider", cascade = REMOVE)
	@OrderBy
	private List<Treatment> treatments;
	
	public Provider() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getNpi() {
		return npi;
	}

	public void setNpi(long npi) {
		this.npi = npi;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public List<Treatment> getTreatments() {
		return treatments;
	}

	public void setTreatments(List<Treatment> treatments) {
		this.treatments = treatments;
	}
   
}
