/*
 * < zeddarn, This application manages the daily activities of a Teacher and a Student of a School>
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

package com.virtusa.akura.common.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.virtusa.akura.api.dao.BaseDaoImpl;
import com.virtusa.akura.api.dto.Race;
import com.virtusa.akura.api.exception.AkuraAppException;
import com.virtusa.akura.api.exception.AkuraConstant;

/**
 * @author Virtusa Corporation
 */

public class RaceDaoImpl extends BaseDaoImpl<Race> implements RaceDao {
    
    /** String constant for holding respective query name. */
    private static final String GET_RACE_BY_NAME = "getRaceByName";
    
    /**
     * Retrieve all the race's with the racename.
     * 
     * @param raceName The name of the race.
     * @return race the race with the name "raceName".
     * @throws AkuraAppException SMS Exceptions.
     */
    @SuppressWarnings("unchecked")
    public Race getRaceByName(String raceName) throws AkuraAppException {

        List<Race> raceList = null;
        Race race = null;
        
        try {
            raceList = getHibernateTemplate().findByNamedQuery(GET_RACE_BY_NAME, raceName);
            if (raceList != null && !raceList.isEmpty()) {
                race = raceList.get(0);
            }
        } catch (DataAccessException e) {
            throw new AkuraAppException(AkuraConstant.HIBERNATE_INVALID_ADD_OPERATION, e);
        }
        
        return race;
    }
    
}
