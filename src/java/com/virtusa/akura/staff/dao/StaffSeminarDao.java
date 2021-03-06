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

package com.virtusa.akura.staff.dao;

import java.util.Date;
import java.util.List;

import com.virtusa.akura.api.dao.BaseDao;
import com.virtusa.akura.api.dto.StaffSeminar;
import com.virtusa.akura.api.exception.AkuraAppException;

/**
 * The interface StaffSeminarDao provides persistence layer functionality for the StaffSeminar domain object.
 *
 * @author Virtusa Corporation
 */
public interface StaffSeminarDao extends BaseDao<StaffSeminar> {

    /**
     * Retrieves list of seminars for a staff member based on the selected year.
     *
     * @param staffId - holds integer type
     * @param dateSelectedYear - holds date type
     * @return list of club societies for a selected year of a staff.
     * @throws AkuraAppException - throw detailed exception when retrieve list of staff seminars
     */
    List<?> getStaffSeminarByYearList(int staffId, Date dateSelectedYear) throws AkuraAppException;

}
