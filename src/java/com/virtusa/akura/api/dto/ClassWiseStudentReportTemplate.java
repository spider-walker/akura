/*
 * < �KURA, This application manages the daily activities of a Teacher and a Student of a School>
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

package com.virtusa.akura.api.dto;

/**
 * The Class ClassWiseStudentReportTemplate.
 * 
 * @author Virtusa Corporation
 */
public class ClassWiseStudentReportTemplate {
    
    /** The class grade id. */
    private int classGradeId;
    
    /**
     * Gets the class grade id.
     * 
     * @return the classGradeId
     */
    public int getClassGradeId() {
    
        return classGradeId;
    }
    
    /**
     * Sets the class grade id.
     * 
     * @param classGradeIdValue the classGradeId to set
     */
    public void setClassGradeId(int classGradeIdValue) {
    
        this.classGradeId = classGradeIdValue;
    }
}
