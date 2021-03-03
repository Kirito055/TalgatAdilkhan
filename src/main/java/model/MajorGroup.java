package model;

import javax.persistence.*;

@Entity
@Table(name = "group_major")
public class MajorGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long group_major_id;

    public MajorGroup(Group group, Major major ){
        this.group=group;
        this.major=major;
    }
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "group_id")
  private Group group;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "major_id")
  private Major major;
  public MajorGroup(){}

    public long getGroup_major_id() {
        return group_major_id;
    }

    public void setGroup_major_id(long group_major_id) {
        this.group_major_id = group_major_id;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }
}
