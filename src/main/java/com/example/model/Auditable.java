package com.example.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class Auditable<U> {

	@CreatedBy
	@ManyToOne
	@JoinColumn(name = "created_by", updatable = false)
	private U createdBy;

	@CreatedDate
	@Column(name = "created_date", updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@LastModifiedBy
	@ManyToOne
	@JoinColumn(name = "last_modified_by")
	private U lastModifiedBy;

	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;

	public Auditable() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auditable(U createdBy, Date createdDate, U lastModifiedBy, Date lastModifiedDate) {
		super();
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.lastModifiedBy = lastModifiedBy;
		this.lastModifiedDate = lastModifiedDate;
	}

	public U getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(U createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public U getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(U lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	
	
}