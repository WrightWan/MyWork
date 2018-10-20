package edu.stevens.cs548.clinic.domain;

import static javax.persistence.CascadeType.REMOVE;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import edu.stevens.cs548.clinic.domain.Treatment;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Radiology
 *
 */
@Entity
@DiscriminatorValue("R")

public class Radiology extends Treatment implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy = "radiology", cascade = REMOVE)
	@OrderBy
	private List<RadiologyDate> dates;

	public List<RadiologyDate> getDates() {
		return dates;
	}

	public void setDates(List<RadiologyDate> dates) {
		this.dates = dates;
	}
	
	public Radiology() {
		super();
		this.setTreatmentType("R");
	}


   
}
