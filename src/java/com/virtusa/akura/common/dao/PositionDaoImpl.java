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

import com.virtusa.akura.api.dao.BaseDaoImpl;
import com.virtusa.akura.api.dto.Position;
import com.virtusa.akura.api.exception.AkuraAppException;

/**
 * This is the implementation class for PositionDao interface. It handles all the persistent related
 * functionalities for the position object.
 * 
 * @author Virtusa Corporation
 */
public class PositionDaoImpl extends BaseDaoImpl<Position> implements PositionDao {
    
    /**
     * Check whether the Position is exists.
     * 
     * @param description - String
     * @throws AkuraAppException Detailed exception
     * @return returns a boolean value.
     */
    
    @Override
    public boolean isExistPosition(String description) throws AkuraAppException {
    
        boolean isExist = false;
        
        List<Position> positionList = getHibernateTemplate().findByNamedQuery("isExistPosition", description);
        if (positionList != null && !positionList.isEmpty()) {
            isExist = true;
        }
        
        return isExist;
    }
}
