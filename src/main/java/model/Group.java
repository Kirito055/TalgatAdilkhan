package model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long group_id;
    private String group;

    @OneToMany(mappedBy = "group",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private Set<MajorGroup> majorGroups=new HashSet<>();

    @OneToMany(mappedBy = "group")
    private Set<User> users;

    public long getGroup_id() {
        return group_id;
    }

    public void setGroup_id(long group_id) {
        this.group_id = group_id;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Set<MajorGroup> getMajorGroups() {
        return majorGroups;
    }

    public void setMajorGroups(Set<MajorGroup> majorGroups) {
        this.majorGroups = majorGroups;
    }
}
