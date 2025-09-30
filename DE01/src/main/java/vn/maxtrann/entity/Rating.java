package vn.maxtrann.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "rating")
@NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r")
public class Rating implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "rating")
    private Integer rating;

    @Column(name = "reviewText")
    private String reviewText;

    @ManyToOne
    @JoinColumn(name = "userid")
    private User user;

    @ManyToOne
    @JoinColumn(name = "bookid")
    private Book book;
}
