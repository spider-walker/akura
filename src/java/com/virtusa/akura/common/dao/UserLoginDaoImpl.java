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

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;

import com.virtusa.akura.api.dao.BaseDaoImpl;
import com.virtusa.akura.api.dto.UserLogin;
import com.virtusa.akura.api.enums.UserRole;
import com.virtusa.akura.api.exception.AkuraAppException;
import com.virtusa.akura.api.exception.AkuraConstant;

/**
 * Implementation for UserLoginDao.
 * 
 * @author Virtusa Corporation
 */
public class UserLoginDaoImpl extends BaseDaoImpl<UserLogin> implements UserLoginDao {
    
    /**
     * Logger to log the exceptions.
     */
    private static final Logger LOG = Logger.getLogger(UserLoginDaoImpl.class);
    
    /** String Constant for holding respective query name. */
    private static final String SEARCH_SYSTEM_USER = "searchSystemUser";
    
    /** String Constant for holding respective query name. */
    private static final String SEARCH_SYSTEM_USER_BY_NAME_AND_ROLE = "searchSystemUserByNameAndRole";
    
    /** String Constant for holding respective query name. */
    private static final String GET_SYSTEM_USER_BY_ROLE_ID_AND_IDENTIFICATION_NO =
            "getUserLoginByUserRoleIdAndIdentificationNo";
    
    /** String Constant for holding error log massage. */
    private static final String ERROR_WHILE_SEARCHING_USER_LOGIN = "Error while searching UserLogin ---> ";
    
    /** String Constant for holding respective query name. */
    private static final String GET_USER_BY_IDENTIFICATION_NO = "getUserByIdentificationNo";
    
    /** String Constant for holding respective query name. */
    private static final String GET_USER_BY_NAME = "getUserByName";
    
    /** The constant for "%" character. */
    private static final String MODULO_STRING = "%";
    
    /** String constant for holding respective query name. */
    private static final String GET_ANY_USER_BY_NAME = "getAnyUserByName";
    
    /** String constant for holding respective query name `getAnyUserByEmail`. */
    private static final String GET_ANY_USER_BY_EMAIL = "getAnyUserByEmail";
    
    /** String constant for holding respective query name. */
    private static final String GET_USER_LOGIN_LIST_BY_USER_ROLE = "getUserLoginListByUserRole";
    
    /** key to hold the string userRoleIdList. */
    private static final String USER_ROLE_ID_LIST = "userRoleIdList";
    
    /** String constant for holding respective query name `getStudentByUserRoleAndId`. */
    private static final String GET_STUDENT_BY_ROLE_ID_AND_IDENTIFICATOIN_NO =
            "getStudentByUserRoleIdAndIdIdentificationNo";
    
    /** String constant for holding respective query name `getStaffByUserRoleAndId`. */
    private static final String GET_STAFF_BY_ROLE_ID_AND_IDENTIFICATOIN_NO =
            "getStaffByUserRoleIdAndIdIdentificationNo";
    
    /** String constant for holding respective query name. */
    private static final String GET_USERS_OF_ANY_STATUS_BY_REGISTRATION_NO = "getUsersOfAnyStatusByRegistrationNo";
    
    /** String constant for holding respective query name. */
    private static final String GET_PARENT_IDS_BY_REGISTRATION_NO = "getParentsByUserRoleIdAndIdIdentificationNo";
    
    /** String constant for holding respective query name. */
    private static final String GET_CLASS_TEACHER_LIST = "getClassTeacherIdList";
    
    /** String Constant for holding error log massage. */
    private static final String ERROR_WHILE_CHECKING_STUDENT_STATUS = "error while checking student status";

    /**
     * Retrieve all the user's with the username.
     * 
     * @param userName The user name of the user.
     * @return userLogin the user with the user name "userName".
     * @throws AkuraAppException SMS Exceptions.
     */
    @SuppressWarnings("unchecked")
    public UserLogin getAnyUserByName(String userName) throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        UserLogin userLogin = null;
        
        try {
            userLoginList = getHibernateTemplate().findByNamedQuery(GET_ANY_USER_BY_NAME, userName);
            if (userLoginList != null && !userLoginList.isEmpty()) {
                userLogin = userLoginList.get(0);
            }
        } catch (DataAccessException e) {
            throw new AkuraAppException(AkuraConstant.HIBERNATE_INVALID_ADD_OPERATION, e);
        }
        
        return userLogin;
    }
    
    /**
     * Retrieve the user login by passing the user's email. This returns any user with the email passed.
     * 
     * @param email - String
     * @return UserLogin object.
     * @throws AkuraAppException SMS Exceptions.
     */
    @SuppressWarnings("unchecked")
    public UserLogin getAnyUserByEmail(String email) throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        UserLogin userLogin = null;
        
        try {
            userLoginList = getHibernateTemplate().findByNamedQuery(GET_ANY_USER_BY_EMAIL, email);
            if (userLoginList != null && !userLoginList.isEmpty()) {
                userLogin = userLoginList.get(0);
            }
        } catch (DataAccessException e) {
            throw new AkuraAppException(AkuraConstant.HIBERNATE_INVALID_ADD_OPERATION, e);
        }
        
        return userLogin;
    }
    
    /**
     * Retrieve the user login by passing the user's role_id. This returns any user with the role_id passed.
     * 
     * @param roleId - int
     * @param identificationNo - String
     * @return UserLogin object.
     * @throws AkuraAppException SMS Exceptions.
     */
    public List<Integer> getStudentByUserRoleIdAndIdentificationNo(int roleId, String identificationNo)
            throws AkuraAppException {

        return getAnyUserByUserRoleIdAndIdentificationNo(roleId, identificationNo,
                GET_STUDENT_BY_ROLE_ID_AND_IDENTIFICATOIN_NO);
    }
    
    @SuppressWarnings("unchecked")
    private List<Integer> getAnyUserByUserRoleIdAndIdentificationNo(int roleId, String identificationNo,
            String namedQuery) throws AkuraAppException {

        try {
            return getHibernateTemplate().findByNamedQuery(namedQuery, roleId, identificationNo);
            
        } catch (DataAccessException e) {
            throw new AkuraAppException(AkuraConstant.HIBERNATE_INVALID_ADD_OPERATION, e);
        }
        
    }
    
    /**
     * Method to retrieve UserLogin for given userName.
     * 
     * @param userName - userName
     * @return userLogin for respective userName.
     * @throws AkuraAppException SMS Exceptions.
     */
    @SuppressWarnings("unchecked")
    public UserLogin getUserLoginByName(String userName) throws AkuraAppException {

        UserLogin userLogin = null;
        try {
            List<UserLogin> userLoginList =
                    getHibernateTemplate().findByNamedQuery(GET_USER_BY_NAME, new Object[] { userName });
            
            if (!userLoginList.isEmpty()) {
                userLogin = userLoginList.get(0);
                getSession().update(userLogin);
            }
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        return userLogin;
    }
    
    /**
     * Retrieve the user login by using user identification no.
     * 
     * @param identificationNo - String
     * @return UserLogin object
     * @throws AkuraAppException - throw this
     */
    @SuppressWarnings("unchecked")
    public UserLogin getUserLoginByIdentificationNo(String identificationNo) throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        UserLogin userLogin = null;
        
        try {
            userLoginList = getHibernateTemplate().findByNamedQuery(GET_USER_BY_IDENTIFICATION_NO, identificationNo);
            if (userLoginList != null && !userLoginList.isEmpty()) {
                userLogin = userLoginList.get(0);
            }
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userLogin;
    }
    
    /**
     * search system user by user name.
     * 
     * @param userLogin - UserLogin object.
     * @return {@link List} list of user login objects.
     * @throws AkuraAppException when fails.
     */
    @SuppressWarnings("unchecked")
    public List<UserLogin> searchSystemUserByUserName(UserLogin userLogin) throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        String username = MODULO_STRING + userLogin.getUsername() + MODULO_STRING;
        try {
            userLoginList = getHibernateTemplate().findByNamedQuery(SEARCH_SYSTEM_USER, username, username);
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userLoginList;
    }
    
    /**
     * search system user by user name and role.
     * 
     * @param userLogin - UserLogin object.
     * @return {@link List} list of user login objects.
     * @throws AkuraAppException when fails.
     */
    @SuppressWarnings("unchecked")
    public List<UserLogin> searchSystemUserByUserNameAndRole(UserLogin userLogin) throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        String username = MODULO_STRING + userLogin.getUsername() + MODULO_STRING;
        int roleId = userLogin.getUserRoleId();
        
        try {
            userLoginList =
                    getHibernateTemplate().findByNamedQuery(SEARCH_SYSTEM_USER_BY_NAME_AND_ROLE, username, username,
                            roleId, roleId);
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userLoginList;
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<UserLogin> getUserLoginListByUserRole(List<Integer> userRoleIdList) throws AkuraAppException {

        try {
            return (List<UserLogin>) getHibernateTemplate().findByNamedQueryAndNamedParam(
                    GET_USER_LOGIN_LIST_BY_USER_ROLE, new String[] { USER_ROLE_ID_LIST },
                    new Object[] { userRoleIdList });
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
    }
    
    /** {@inheritDoc} */
    public List<Integer> getStaffByUserRoleIdAndIdentificationNo(int roleId, String identificationNo)
            throws AkuraAppException {

        return getAnyUserByUserRoleIdAndIdentificationNo(roleId, identificationNo,
                GET_STAFF_BY_ROLE_ID_AND_IDENTIFICATOIN_NO);
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public UserLogin getUserLoginByUserRoleAndIdetificationNo(int userRoleId, String identificationNo)
            throws AkuraAppException {

        List<UserLogin> userLoginList = null;
        try {
            userLoginList =
                    getHibernateTemplate().findByNamedQuery(GET_SYSTEM_USER_BY_ROLE_ID_AND_IDENTIFICATION_NO,
                            userRoleId, identificationNo);
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userLoginList.size() != 0 ? userLoginList.get(0) : null;
        
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<UserLogin> getUserLoginOfAnyStatusByRegistrationNo(String registrationNo) throws AkuraAppException {

        try {
            return (List<UserLogin>) getHibernateTemplate().findByNamedQuery(
                    GET_USERS_OF_ANY_STATUS_BY_REGISTRATION_NO, registrationNo);
            
        } catch (DataAccessException e) {
            
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<Integer> getParentByUserRoleIdAndIdentificationNo(int roleId, String identificationNo)
            throws AkuraAppException {

        try {
            return (List<Integer>) getHibernateTemplate().findByNamedQuery(GET_PARENT_IDS_BY_REGISTRATION_NO, roleId,
                    identificationNo);
            
        } catch (DataAccessException e) {
            
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public int isValidationIdentificationNo(String query, String identificationNo) throws AkuraAppException {

        List<Integer> userList = null;
        
        try {
            userList = (List<Integer>) getHibernateTemplate().findByNamedQuery(query, identificationNo);
            
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userList.isEmpty() ? 0 : userList.get(0);
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public boolean isExistingIdentificationNo(String query, String identificationNo, int roleId)
            throws AkuraAppException {

        List<Integer> userList = null;
        
        try {
            userList = (List<Integer>) getHibernateTemplate().findByNamedQuery(query, roleId, identificationNo);
            
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return userList.isEmpty() ? false : true;
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public boolean isPastUser(String query, String identificationNo) throws AkuraAppException {

        List<Date> userList = null;
        Date departureDate = null;
        
        try {
            userList = (List<Date>) getHibernateTemplate().findByNamedQuery(query, identificationNo);
            departureDate = !userList.isEmpty() ? (Date) userList.get(0) : null;
            
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return departureDate != null ? true : false;
    }
    
    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<Integer> getClassTeacherIdList(int userLoginId, Date year, int classGradeId)
            throws AkuraAppException {

        List<Integer> classTeacherIdList = null;
        
        try {
            classTeacherIdList =
                    (List<Integer>) getHibernateTemplate().findByNamedQuery(GET_CLASS_TEACHER_LIST,
                            UserRole.ROLE_TEACHER.getUserRoleId(), userLoginId, year, classGradeId);
            
        } catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_SEARCHING_USER_LOGIN + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return classTeacherIdList;
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean isNonCurrentStudent(String query, String identificationNo) throws AkuraAppException {
        
        boolean nonCurrentStudent;
        
        try{
            nonCurrentStudent = (getHibernateTemplate().findByNamedQuery(query, identificationNo)).isEmpty() 
                             ? false : true;
        }catch (DataAccessException e) {
            LOG.error(ERROR_WHILE_CHECKING_STUDENT_STATUS + e.toString());
            throw new AkuraAppException(AkuraConstant.DB_CONNECTION_ERROR, e);
        }
        
        return nonCurrentStudent;
    }
    
}
