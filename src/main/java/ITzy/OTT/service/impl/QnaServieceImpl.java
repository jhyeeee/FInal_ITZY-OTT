package ITzy.OTT.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.OTT.dao.QnaDao;
import ITzy.OTT.dto.QnaDto;
import ITzy.OTT.service.QnaService;

@Service
public class QnaServieceImpl implements QnaService {

	@Autowired
	QnaDao dao;
	
	@Override
	public List<QnaDto> myQna(String id) {
		return dao.myQna(id);
	}

	@Override
	public boolean addQna(QnaDto dto) {
		int count = dao.addQna(dto);
		return count>0?true:false;
	}
	@Override
	public QnaDto ansQna(int seq) {
		return dao.ansQna(seq);
	}
	@Override
	public QnaDto findQna(int seq) {
		return dao.findQna(seq);
	}

}