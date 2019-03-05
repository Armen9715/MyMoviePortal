package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Movie {
    private int id;
    private String name;
    private String description;
    private Date createdDate;
    private String picture;
    private String year;
    private List <Genre> genre;
    private String director;
    private User User;


}