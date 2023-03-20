package ITzy.OTT.dto;

import java.io.Serializable;

public class NbsLoveDto implements Serializable{
//	create table nbslike(
//			like_no int(30) AUTO_INCREMENT PRIMARY KEY not null,
//		    seq int,
//		    id varchar(50),
//		    love int default 0); 
	private int like_no;
	private int seq;
	private String id;
	private int love;
	
	public NbsLoveDto() {
	}

	public NbsLoveDto(int like_no, int seq, String id, int love) {
		super();
		this.like_no = like_no;
		this.seq = seq;
		this.id = id;
		this.love = love;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	@Override
	public String toString() {
		return "NbsLoveDto [like_no=" + like_no + ", seq=" + seq + ", id=" + id + ", love=" + love + "]";
	}
	
}
