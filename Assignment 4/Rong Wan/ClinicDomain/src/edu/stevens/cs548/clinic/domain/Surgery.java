package edu.stevens.cs548.clinic.domain;

import java.io.Serializable;
import java.util.Date;

import edu.stevens.cs548.clinic.domain.Treatment;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Surgery
 *
 */
@Entity
@DiscriminatorValue("S")

public class Surgery extends Treatment implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Temporal(TemporalType.DATE)
	private Date date;

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public Surgery() {
		super();
		this.setTreatmentType("S");
	}


   
}
