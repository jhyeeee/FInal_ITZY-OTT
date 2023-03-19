package ITzy.OTT.service;

import java.util.List;

import ITzy.OTT.dto.QnaDto;

public interface QnaService {
	List<QnaDto> myQna(String id);
	boolean addQna(QnaDto dto);
	QnaDto findQna(int seq);
	QnaDto ansQna(int seq);
}