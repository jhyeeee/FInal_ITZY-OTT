package ITzy.OTT.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ITzy.OTT.dto.BbsComment;
import ITzy.OTT.dto.BbsDto;
import ITzy.OTT.dto.BbsParam;

public interface BbsService {
	List<BbsDto> bbslist(BbsParam bbs);	
	int getAllBbs(BbsParam bbs);
	
	boolean writeBbs(BbsDto dto);
	
	BbsDto getBbs(int seq);
	
	boolean updateBbs(BbsDto dto);	
	
	boolean answerBbs(BbsDto dto);
	
	boolean commentWrite(BbsComment bbs);
	List<BbsComment> commentList(int seq);
	
	BbsDto deleteBbs(int seq);

	void downcount(int seq);
	
	static final String IMAGE_REPO="C:\\OTTproject\\image";
	String saveFile(MultipartFile file);
}
