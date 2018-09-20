package com.kh.spring.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

//하이
public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if (parameter != null) {
			ps.setString(i, String.join(",", parameter));
		} else {
			ps.setString(i, "");
		}

	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String columValues = rs.getString(columnName);
		String[] result = columValues.split(",");
		return result;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String columValues = rs.getString(columnIndex);
		String[] result = columValues.split(",");
		return result;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String columValues = cs.getString(columnIndex);
		String[] result = columValues.split(",");
		return result;
	}

}