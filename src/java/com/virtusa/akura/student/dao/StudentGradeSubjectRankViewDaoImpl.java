/*
 * < ?KURA, This application manages the daily activities of a Teacher and a Student of a School>
 *
 * Copyright (C) 2012 Virtusa Corporation.
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

package com.virtusa.akura.student.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.virtusa.akura.api.dao.BaseDaoImpl;
import com.virtusa.akura.api.dto.StudentGradeSubjectRankView;
import com.virtusa.akura.api.exception.AkuraAppException;
import com.virtusa.akura.api.exception.AkuraConstant;

/**
 * @author Virtusa Corporation
 */
public class StudentGradeSubjectRankViewDaoImpl extends BaseDaoImpl<StudentGradeSubjectRankView> implements
        StudentGradeSubjectRankViewDao {
    
    /** Constant for holding getStudentGradeSubjectRankList. */
    private static final String GET_STUDENT_GRADE_SUBJECT_RANK_LIST = "getStudentGradeSubjectRankList";

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<StudentGradeSubjectRankView> getStudentGradeSubjectRank(int gradeSubjectId, int year, int noOfPrizes)
            throws AkuraAppException {
    
        try {
            getHibernateTemplate().setMaxResults(noOfPrizes);
            return getHibernateTemplate().findByNamedQuery(GET_STUDENT_GRADE_SUBJECT_RANK_LIST, gradeSubjectId, year);
            
        } catch (DataAccessException e) {
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
    }
    
}
