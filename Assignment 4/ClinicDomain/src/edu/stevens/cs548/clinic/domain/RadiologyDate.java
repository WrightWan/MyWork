package edu.stevens.cs548.clinic.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: RadiologyDate
 *
 */
@Entity

public class RadiologyDate implements Serializable {

	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private long id;
	
	@ManyToOne
	@JoinColumn(name = "radiology_fk", referencedColumnName = "dates")
	private Radiology radiology;
	
	@Temporal(TemporalType.DATE)
	private Date date;

	public RadiologyDate() {
		super();
	}
   
}
