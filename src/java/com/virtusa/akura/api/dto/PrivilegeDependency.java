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

package com.virtusa.akura.api.dto;

/**
 * This class represents all properties of PrivilegeDependency domain object.
 * 
 * @author Virtusa Corporation
 */
public class PrivilegeDependency extends BaseDomain{
    
    /** attribute for holding string. */
    private static final String DEPENDENCY_ID = ", dependency=";

    /** attribute for holding string. */
    private static final String PRIVILEGE_ID = ", privilege=";

    /** attribute for holding string. */
    private static final String PRIVILEGE_DEPENDENCY_ID = "privilegeDependencyId=";

    /**
     * serialVersionUID- final.
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * Represents the ID of a PrivilegeDependency.
     */
    private int privilegeDependencyId;
    
    /**
     * Represents the related privilege object of a PrivilegeDependency.
     */
    private Privilege privilege;
    
    /**
     * Represents the related dependency object of a PrivilegeDependency.
     */
    private Privilege dependency;
    
    /**
     * Default constructor.
     */
    public PrivilegeDependency() {

    }
    
    /**
     * Returns the ID of the PrivilegeDependency object.
     * 
     * @return - the ID of the PrivilegeDependency.
     */
    public int getPrivilegeDependencyId() {

        return privilegeDependencyId;
    }
    
    /**
     * Sets the ID for this PrivilegeDependency with a given key.
     * 
     * @param privilegeDependencyIdObj - the ID of the PrivilegeDependency.
     */
    public void setPrivilegeDependencyId(int privilegeDependencyIdObj) {

        this.privilegeDependencyId = privilegeDependencyIdObj;
    }
    
    /**
     * Returns the privilege of the PrivilegeDependency object.
     * 
     * @return - the privilege of the PrivilegeDependency.
     */
    public Privilege getPrivilege() {

        return privilege;
    }
    
    /**
     * Sets the privilege for this PrivilegeDependency.
     * 
     * @param privilegeObj - the privilege of the PrivilegeDependency.
     */
    public void setPrivilege(Privilege privilegeObj) {

        this.privilege = privilegeObj;
    }
    
    /**
     * Returns the dependency of the PrivilegeDependency object.
     * 
     * @return - the dependency of the PrivilegeDependency.
     */
    public Privilege getDependency() {

        return dependency;
    }
    
    /**
     * Sets the dependency for this PrivilegeDependency.
     * 
     * @param dependencyObj - the privilege of the PrivilegeDependency.
     */
    public void setDependency(Privilege dependencyObj) {

        this.dependency = dependencyObj;
    }
    
    /**
     * Returns a string representation of the object.
     * 
     * @return - the current object details.
     */
    @Override
    public String toString() {

        return PRIVILEGE_DEPENDENCY_ID + privilegeDependencyId + PRIVILEGE_ID + privilege + DEPENDENCY_ID
                + dependency;
    }
}
