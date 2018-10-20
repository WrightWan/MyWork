package edu.stevens.cs548.clinic.domain;

import java.io.Serializable;
import edu.stevens.cs548.clinic.domain.Treatment;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: DrugTreatment
 *
 */
@Entity
@DiscriminatorValue("D")

public class DrugTreatment extends Treatment implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private String drug;
	private float dosage;

	public DrugTreatment() {
		super();
		this.setTreatmentType("D");
	}

	public String getDrug() {
		return drug;
	}

	public void setDrug(String drug) {
		this.drug = drug;
	}

	public float getDosage() {
		return dosage;
	}

	public void setDosage(float dosage) {
		this.dosage = dosage;
	}
   
}
