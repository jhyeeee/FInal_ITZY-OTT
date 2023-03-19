package ITzy.OTT.dao;

import java.util.List;

import ITzy.OTT.dto.QnaDto;

public interface QnaDao {
	List<QnaDto> myQna(String id);
	int addQna(QnaDto dto);
	QnaDto findQna(int seq);
	QnaDto ansQna(int seq);

}