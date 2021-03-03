package model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Major {
    @Id
    private long major_id;
    private String major_name;

    @OneToMany(mappedBy = "major",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private Set<MajorGroup> majorGroups=new HashSet<>();

    public Major(){

    }

    public long getMajor_id() {
        return major_id;
    }

    public void setMajor_id(long major_id) {
        this.major_id = major_id;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }

    public Set<MajorGroup> getMajorGroups() {
        return majorGroups;
    }

    public void setMajorGroups(Set<MajorGroup> majorGroups) {
        this.majorGroups = majorGroups;
    }
}
