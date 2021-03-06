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

package com.virtusa.akura.common.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.virtusa.akura.api.dto.Module;
import com.virtusa.akura.api.dto.Privilege;
import com.virtusa.akura.api.dto.RolePrivilege;
import com.virtusa.akura.api.dto.RoleTab;
import com.virtusa.akura.api.dto.SecurityQuestions;
import com.virtusa.akura.api.dto.Tab;
import com.virtusa.akura.api.dto.UserLogin;
import com.virtusa.akura.api.dto.UserRole;
import com.virtusa.akura.api.dto.UserSecurityQuestions;
import com.virtusa.akura.api.exception.AkuraAppException;
import com.virtusa.akura.api.exception.InvalidIdentificationNoException;
import com.virtusa.akura.api.exception.NonCurrentStudentUserLoginCreationException;
import com.virtusa.akura.api.exception.PastStaffException;
import com.virtusa.akura.api.exception.UniqueUserNameEmailException;
import com.virtusa.akura.common.dao.ModuleDao;
import com.virtusa.akura.common.dao.PrivilegeDependencyDao;
import com.virtusa.akura.common.dao.RolePrivilegeDao;
import com.virtusa.akura.common.dao.RoleTabDao;
import com.virtusa.akura.common.dao.SecurityQuestionsDao;
import com.virtusa.akura.common.dao.UserDao;
import com.virtusa.akura.common.dao.UserLoginDao;
import com.virtusa.akura.common.dao.UserRoleDao;
import com.virtusa.akura.common.dao.UserSecurityQuestionsDao;
import com.virtusa.akura.util.PropertyReader;

/**
 * UserDetailService for user authentication.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    
    /** holds userdao. */
    private UserDao userDao;
    
    /** holds userRoledao. */
    private UserRoleDao userRoleDao;
    
    /** holds the passwordEncoder. */
    private PasswordEncoder passwordEncoder;
    
    /** holds the userLoginDao. */
    private UserLoginDao userLoginDao;
    
    /** holds the SecurityQuestions. */
    private SecurityQuestionsDao securityQuestionsDao;
    
    /** holds the User specific security questions. */
    private UserSecurityQuestionsDao userSecurityQuestionsDao;
    
    /** holds the role specific tabs. */
    private RoleTabDao roleTabDao;
    
    /** holds the modules. */
    private ModuleDao moduleDao;
    
    /** holds the role specific tabs. */
    private RolePrivilegeDao rolePrivilegeDao;
    
    /** holds the PrivilegeDependencyDao. */
    private PrivilegeDependencyDao privilegeDependencyDao;
    
    /** A string use to generate a random password. */
    public static final String RANDOMSTRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    /** The length of the generated password. */
    public static final int PASSWORDLENGTH = 10;
    
    /** Holds the error message key. */
    private static final String ERROR_MESSAGE_PAST_USER = "USER.CREATE.USER.PAST.ERROR";
    
    /** Holds the error message key. */
    private static final String ERROR_MESSAGE_UNIQUE_UNAME = "USER.CREATE.USER.UNIQUE.UNAME.ERROR";
    
    /** Holds the error message key. */
    private static final String ERROR_MESSAGE_UNIQUE_EMAIL = "USER.CREATE.USER.UNIQUE.EMAIL.ERROR";
    
    /** Holds the error message key. */
    private static final String ERROR_MESSAGE_IDENTIFICATION_NO_INVALID =
            "USER.CREATE.USER.IDENTIFICATION.NO.INVALID.ERROR";
    
    /** Holds the error message key. */
    private static final String ERROR_MESSAGE_IDENTIFICATION_NO_EXIST =
            "USER.CREATE.USER.IDENTIFICATION.NO.EXIST.ERROR";
    
    /** Holds the error message key. */
    private static final String ERROR_USER_CREATE_USER_STUDENT_NON_CURRENT = "USER.CREATE.USER.STUDENT.NON.CURRENT";
    
    /** Holds the AkuraErrorMsg property file name. */
    private static final String AKURA_ERROR_MSG_PROPERTY = "AkuraErrorMsg";
    
    /** String constant for holding respective query name. */
    private static final String IS_VALIDATION_IDENTIFICATION_NO_FOR_STUDENT = "isValidationIdentificationNoForStudent";
    
    /** String constant for holding respective query name. */
    private static final String IS_VALIDATION_IDENTIFICATION_NO_FOR_STAFF = "isValidationIdentificationNoForStaff";
    
    /** String constant for holding respective query name. */
    private static final String IS_VALIDATION_IDENTIFICATION_NO_FOR_PARENT = "isValidationIdentificationNoForParent";
    
    /** String constant for holding respective query name. */
    private static final String IS_EXISTING_IDENTIFICATION_NO_FOR_STUDENT = "isExistingIdentificationNoForStudent";
    
    /** String constant for holding respective query name. */
    private static final String IS_EXISTING_IDENTIFICATION_NO_FOR_STAFF = "isExistingIdentificationNoForStaff";
    
    /** String constant for holding respective query name. */
    private static final String IS_EXISTING_IDENTIFICATION_NO_FOR_PARENT = "isExistingIdentificationNoForParent";
    
    /** String constant for holding respective query name. */
    private static final String IS_PAST_STAFF = "isPastStaff";
    
    /** String constant for holding respective query name. */
    private static final String IS_NON_CURRENT_STUDENT = "isNonCurrentStudent";
    
    /**
     * return userDao of the Student.
     * 
     * @return the userdao
     */
    public UserDao getUserDao() {

        return userDao;
    }
    
    /**
     * set the userDao.
     * 
     * @param moduleDaoObj the moduleDao to set
     */
    public void setModuleDao(ModuleDao moduleDaoObj) {

        this.moduleDao = moduleDaoObj;
    }
    
    /**
     * set the userDao.
     * 
     * @param userDaoVal the userdao to set
     */
    public void setUserDao(UserDao userDaoVal) {

        this.userDao = userDaoVal;
    }
    
    /**
     * set the PrivilegeDependencyDao.
     * 
     * @param privilegeDependencyDaoObj the PrivilegeDependencyDao to set
     */
    public void setPrivilegeDependencyDao(PrivilegeDependencyDao privilegeDependencyDaoObj) {

        this.privilegeDependencyDao = privilegeDependencyDaoObj;
    }
    
    /**
     * Set the userLoginDao.
     * 
     * @param userLoginDaoValue the userLoginDao to set
     */
    public void setUserLoginDao(UserLoginDao userLoginDaoValue) {

        this.userLoginDao = userLoginDaoValue;
    }
    
    /**
     * set passwordEncoder.
     * 
     * @param passwordEncoderVal the passwordEncoder to set
     */
    public void setPasswordEncoder(PasswordEncoder passwordEncoderVal) {

        this.passwordEncoder = passwordEncoderVal;
    }
    
    /**
     * get available userRole list.
     * 
     * @throws AkuraAppException AkuraAppException
     * @return available userRoleList.
     */
    public List<UserRole> getUserRoleList() throws AkuraAppException {

        return userRoleDao.findAll(UserRole.class);
    }
    
    /**
     * set userRoleDao for the userService.
     * 
     * @param userRoleDaoVal the userRoleDao to set
     */
    public void setUserRoleDao(UserRoleDao userRoleDaoVal) {

        this.userRoleDao = userRoleDaoVal;
    }
    
    /**
     * Get the users Security Questions.
     * 
     * @return UserSecurityQuestionsDao
     */
    public UserSecurityQuestionsDao getUserSecurityQuestionsDao() {

        return userSecurityQuestionsDao;
    }
    
    /**
     * Set the UserSecurityQuestionsDao for User.
     * 
     * @param userSecurityQuestionDao user security question to be set.
     */
    public void setUserSecurityQuestionsDao(UserSecurityQuestionsDao userSecurityQuestionDao) {

        this.userSecurityQuestionsDao = userSecurityQuestionDao;
    }
    
    /**
     * Get the Security Questions.
     * 
     * @return securityQuestionsDao.
     */
    public SecurityQuestionsDao getSecurityQuestionsDao() {

        return securityQuestionsDao;
    }
    
    /**
     * set the SecurityQuestionsDao.
     * 
     * @param securityQuestionsDaoVal to be set.
     */
    public void setSecurityQuestionsDao(SecurityQuestionsDao securityQuestionsDaoVal) {

        this.securityQuestionsDao = securityQuestionsDaoVal;
    }
    
    /**
     * set the RoleTabDao.
     * 
     * @param roleTabDaoObj to be set.
     */
    public void setRoleTabDao(RoleTabDao roleTabDaoObj) {

        this.roleTabDao = roleTabDaoObj;
    }
    
    /**
     * set the RolePrivilegeDao.
     * 
     * @param rolePrivilegeDaoObj to be set.
     */
    public void setRolePrivilegeDao(RolePrivilegeDao rolePrivilegeDaoObj) {

        this.rolePrivilegeDao = rolePrivilegeDaoObj;
    }
    
    /**
     * create a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     * @return flag indicates whether userLogin creation is succeeded.
     */
    public boolean createUser(UserLogin userLogin, final int identificationNo) throws AkuraAppException {

        boolean validityStatus = false;
        
        userLogin.setPassword(passwordEncoder.encodePassword(userLogin.getPassword(), userLogin.getUsername()));
        userLogin.setModifiedTime(new Date());
        userLogin.setUserIdentificationNo(String.valueOf(identificationNo));
        UserLogin userLoginVal = userDao.save(userLogin);
        
        if (userLoginVal != null) {
            validityStatus = true;
        }
        
        return validityStatus;
    }
    
    /**
     * create a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     * @throws UniqueUserNameEmailException UniqueUserNameEmailException
     * @throws PastStaffException -PastStaffException
     * @throws InvalidIdentificationNoException - InvalidIdentificationNoException
     * @throws NonCurrentStudentUserLoginCreationException - throws when user try to create a user account for
     *         non-current student.
     * @return flag indicates whether userLogin creation is succeeded.
     */
    public boolean createSystemUser(UserLogin userLogin) throws AkuraAppException, UniqueUserNameEmailException,
            InvalidIdentificationNoException, PastStaffException, NonCurrentStudentUserLoginCreationException {

        String userName = userLogin.getUsername();
        int roleId = userLogin.getUserRoleId();
        int identificationKey = 0;
        boolean isUserCreationSuccess = false;
        
        /** validate user name */
        if (getAnyUser(userName) != null) {
            throw new UniqueUserNameEmailException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                    ERROR_MESSAGE_UNIQUE_UNAME));
        }
        
        /** validate email */
        if (getAnyUserByEmail(userLogin.getEmail()) != null) {
            throw new UniqueUserNameEmailException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                    ERROR_MESSAGE_UNIQUE_EMAIL));
        }
        
        if (isIdentificationNoRequiresdUserRole(roleId)) {
            /** get the identification key */
            identificationKey = isValidationIdentificationNo(roleId, userLogin.getUserIdentificationNo());
            
            /** validate identification No is valid */
            if (identificationKey == 0) {
                throw new InvalidIdentificationNoException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                        ERROR_MESSAGE_IDENTIFICATION_NO_INVALID));
            }
            
            /** validate identification No is exists */
            if (isExistingIdentificationNo(roleId, userLogin.getUserIdentificationNo())) {
                throw new InvalidIdentificationNoException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                        ERROR_MESSAGE_IDENTIFICATION_NO_EXIST));
            }
            
            /** validate user is past user or not */
            if (isPastUser(roleId, userLogin.getUserIdentificationNo())) {
                if (roleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                        || roleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
                    throw new PastStaffException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                            ERROR_MESSAGE_PAST_USER));
                }
            }
            
            /** validate student is non-current or not */
            if (isNonCurrentStudent(roleId, userLogin.getUserIdentificationNo())) {
                
                if (roleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()) {
                    throw new NonCurrentStudentUserLoginCreationException(PropertyReader.getPropertyValue(
                            AKURA_ERROR_MSG_PROPERTY, ERROR_USER_CREATE_USER_STUDENT_NON_CURRENT));
                }
            }
        }
        /** Initialize the user object */
        userLogin.setUserIdentificationNo(identificationKey + "");
        userLogin.setPassword(passwordEncoder.encodePassword(userLogin.getPassword(), userLogin.getUsername()));
        userLogin.setGeneratedPassword(true);
        userLogin.setStatus(true);
        
        /** Save User Object */
        UserLogin userLoginVal = userDao.save(userLogin);
        
        if (userLoginVal != null) {
            isUserCreationSuccess = true;
        }
        
        return isUserCreationSuccess;
    }
    
    /**
     * check whether the user is a identification No required user or not.
     * 
     * @param userRoleId - userRoleId
     * @return is this user is a system user or not.
     */
    private boolean isIdentificationNoRequiresdUserRole(int userRoleId) {

        boolean isIdentificationNoRequiresdUserRole = false;
        if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_PARENT.getUserRoleId()) {
            isIdentificationNoRequiresdUserRole = true;
        }
        return isIdentificationNoRequiresdUserRole;
    }
    
    /**
     * edit a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     * @throws UniqueUserNameEmailException - UniqueUserNameEmailException
     * @throws PastStaffException - PastStaffException
     * @throws InvalidIdentificationNoException - InvalidIdentificationNoException
     */
    public void editSystemUser(UserLogin userLogin) throws AkuraAppException, UniqueUserNameEmailException,
            PastStaffException, InvalidIdentificationNoException {

        int identificationKey = 0;
        int roleId = userLogin.getUserRoleId();
        UserLogin existUser = null;
        
        /** validate email */
        if (!findUserLogin(userLogin.getUserLoginId()).getEmail().equals(userLogin.getEmail())) {
            if (getAnyUserByEmail(userLogin.getEmail()) != null) {
                throw new UniqueUserNameEmailException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                        ERROR_MESSAGE_UNIQUE_EMAIL));
            }
        }
        
        if (isIdentificationNoRequiresdUserRole(roleId)) {
            /** get the identification key */
            identificationKey = isValidationIdentificationNo(roleId, userLogin.getUserIdentificationNo());
            
            /** validate identification No is valid */
            if (identificationKey == 0) {
                throw new InvalidIdentificationNoException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                        ERROR_MESSAGE_IDENTIFICATION_NO_INVALID));
            }
            
            /** validate user is past user or not */
            if (isPastUser(roleId, userLogin.getUserIdentificationNo())) {
                if (roleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                        || roleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
                    throw new PastStaffException(PropertyReader.getPropertyValue(AKURA_ERROR_MSG_PROPERTY,
                            ERROR_MESSAGE_PAST_USER));
                }
            }
        }
        
        /** Initialize the user object */
        // get the existing user
        existUser = findUserLogin(userLogin.getUserLoginId());
        userLogin.setLoginAttempts(existUser.getLoginAttempts());
        userLogin.setUserIdentificationNo(identificationKey + "");
        userLogin.setPassword(passwordEncoder.encodePassword(userLogin.getPassword(), userLogin.getUsername()));
        userLogin.setGeneratedPassword(true);
        userLogin.setStatus(true);
        
        /** Update User Object */
        userDao.update(userLogin);
    }
    
    /**
     * edit a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     */
    public void editUser(UserLogin userLogin) throws AkuraAppException {

        userLogin.setPassword(passwordEncoder.encodePassword(userLogin.getPassword(), userLogin.getUsername()));
        userLogin.setModifiedTime(new Date());
        userDao.update(userLogin);
    }
    
    /**
     * encode password.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     * @return encoded password.
     */
    public String encodePassword(UserLogin userLogin) throws AkuraAppException {

        return passwordEncoder.encodePassword(userLogin.getPassword(), userLogin.getUsername());
    }
    
    /**
     * Retrieve all the available list of UserLogin.
     * 
     * @return list of UserLogin.
     * @throws AkuraAppException - throw detailed exception.
     */
    public List<UserLogin> getUserLoginList() throws AkuraAppException {

        return userLoginDao.findAll(UserLogin.class);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<UserLogin> getUserLoginListByUserRole(List<Integer> userRoleIdList) throws AkuraAppException {

        return userLoginDao.getUserLoginListByUserRole(userRoleIdList);
    }
    
    /**
     * Retrieve the available UserLogin object.
     * 
     * @param userName - username.
     * @return UserLogin object.
     * @throws AkuraAppException - throw detailed exception.
     */
    public UserLogin getAnyUser(String userName) throws AkuraAppException {

        return userLoginDao.getAnyUserByName(userName);
    }
    
    /**
     * Retrieve the available UserRole object.
     * 
     * @param role - role.
     * @return UserRole object.
     * @throws AkuraAppException - throw detailed exception.
     */
    public UserRole getUserRoleByRoleName(String role) throws AkuraAppException {

        return userRoleDao.getUserRoleByRoleName(role);
    }
    
    /**
     * Retrieve the available UserLogin object.
     * 
     * @param userName - username.
     * @return UserLogin object.
     * @throws AkuraAppException - throw detailed exception.
     */
    public UserLogin getUser(String userName) throws AkuraAppException {

        return userLoginDao.getUserLoginByName(userName);
    }
    
    /**
     * Get the any users UserLogin object by passing the user's email.
     * 
     * @param email - String
     * @throws AkuraAppException AkuraAppException
     * @return returns the UserLogin object.
     */
    public UserLogin getAnyUserByEmail(String email) throws AkuraAppException {

        return userLoginDao.getAnyUserByEmail(email);
    }
    
    /**
     * Get the any users UserLogin object by passing the user's role_id and IdentificationNo.
     * 
     * @param roleId - int
     * @param identificationNo - String
     * @throws AkuraAppException AkuraAppException
     * @return returns the UserLogin object.
     */
    public int getAnyUserByUserRoleIdAndIdentificationNo(int roleId, String identificationNo) throws AkuraAppException {

        int identificationId = 0;
        List<Integer> identificationList = null;
        if (roleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                || roleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
            identificationList = userLoginDao.getStaffByUserRoleIdAndIdentificationNo(roleId, identificationNo);
            
        } else if (roleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()) {
            identificationList = userLoginDao.getStudentByUserRoleIdAndIdentificationNo(roleId, identificationNo);
        }
        if (identificationList != null && !identificationList.isEmpty()) {
            identificationId = identificationList.get(0);
        }
        return identificationId;
    }
    
    /**
     * reset the System user password.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     * @return flag indicates whether the password has successfully changed or not.
     */
    public String resetPassword(UserLogin userLogin) throws AkuraAppException {

        String newPassword = generateRandomPassword();
        
        userLogin.setPassword(passwordEncoder.encodePassword(newPassword, userLogin.getUsername()));
        
        userLogin.setGeneratedPassword(Boolean.TRUE);
        
        userLogin.setModifiedTime(new Date());
        
        userDao.update(userLogin);
        
        return newPassword;
    }
    
    /**
     * Generate a random password.
     * 
     * @throws AkuraAppException AkuraAppException
     * @return Returns the randomly generated pasword.
     */
    public String generateRandomPassword() throws AkuraAppException {

        Random random = new Random();
        StringBuilder password = new StringBuilder(PASSWORDLENGTH);
        for (int i = 0; i < PASSWORDLENGTH; i++) {
            password.append(RANDOMSTRING.charAt(random.nextInt(RANDOMSTRING.length())));
            
        }
        
        return password.toString();
    }
    
    /**
     * Retrieve logged in user by userName.
     * 
     * @param strName - String
     * @return UserLogin Object.
     * @throws AkuraAppException - throw detailed exception.
     */
    public UserLogin getUserByName(String strName) throws AkuraAppException {

        return (UserLogin) userDao.getUserLoginByName(strName);
    }
    
    /**
     * Retrieve userlogin by user identification no.
     * 
     * @param identificationNo - string
     * @return UserLogin object
     * @throws AkuraAppException - throw this
     */
    public UserLogin getUserLoginByIdentificationNo(String identificationNo) throws AkuraAppException {

        return userLoginDao.getUserLoginByIdentificationNo(identificationNo);
    }
    
    /**
     * Update a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     */
    public void updateUser(UserLogin userLogin) throws AkuraAppException {

        userLoginDao.update(userLogin);
    }
    
    /**
     * Delete a system user.
     * 
     * @param userLogin - userLogin
     * @throws AkuraAppException AkuraAppException
     */
    public void deleteUser(UserLogin userLogin) throws AkuraAppException {

        userLoginDao.delete(userLogin);
    }
    
    /**
     * Get all the Security Questions available in the system.
     * 
     * @return UserSecurityQuestions object which has all the security questions.
     * @throws AkuraAppException -throws when failed.
     */
    public List<SecurityQuestions> getAllSecurityQuestions() throws AkuraAppException {

        return securityQuestionsDao.findAll(SecurityQuestions.class);
    }
    
    /**
     * Create a user Security Question for this user.The security questions and answers are updated security
     * questions and answers if it is already there.
     * 
     * @param userSecurityQuestions - a question to be asked form users.
     * @throws AkuraAppException throws when failed.
     */
    public void createSystemUserSecurityQuestion(UserSecurityQuestions userSecurityQuestions) throws AkuraAppException {

        userSecurityQuestionsDao.save(userSecurityQuestions);
    }
    
    /**
     * Get all the UserSecurityQuestions as a list.
     * 
     * @return list of user security questions.
     * @throws AkuraAppException when fails.
     */
    public List<UserSecurityQuestions> getAllUserSecurityQuestions() throws AkuraAppException {

        return userSecurityQuestionsDao.findAll(UserSecurityQuestions.class);
    }
    
    /**
     * Get all the Security questions of this user.
     * 
     * @param userLoginId Id of the User.
     * @return {@link List} list of security questions.(There should be two security questions.)
     * @throws AkuraAppException when fails.
     */
    public List<UserSecurityQuestions> getUserSecurityQuestionsById(int userLoginId) throws AkuraAppException {

        return userSecurityQuestionsDao.getUserSecurityQuestionByUserLoginId(userLoginId);
    }
    
    /**
     * Check the availability of security questions for this user.
     * 
     * @param user -User's user login
     * @return returns true if security questions available for this user.
     * @throws AkuraAppException when fails.
     */
    public boolean isSecurityQuestionsExist(UserLogin user) throws AkuraAppException {

        int userLoginId = user.getUserLoginId();
        boolean result = true;
        
        List<UserSecurityQuestions> userSecurityQuestions =
                userSecurityQuestionsDao.getUserSecurityQuestionByUserLoginId(userLoginId);
        if (userSecurityQuestions.isEmpty()) {
            result = false;
        }
        
        return result;
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean changePassword(UserLogin userLogin, String newPassword) throws AkuraAppException {

        userLogin.setPassword(passwordEncoder.encodePassword(newPassword, userLogin.getUsername()));
        userLogin.setModifiedTime(new Date());
        userDao.update(userLogin);
        
        return validatePassword(newPassword, userLogin);
        
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean validatePassword(String password, UserLogin userLogin) throws AkuraAppException {

        return passwordEncoder.isPasswordValid(userLogin.getPassword(), password, userLogin.getUsername());
    }
    
    /**
     * {@inheritDoc}
     */
    public List<UserLogin> searchUserLogin(UserLogin userLogin) throws AkuraAppException {

        return userLoginDao.searchSystemUserByUserName(userLogin);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<UserLogin> searchUserLoginByUserNameAndRole(UserLogin userLogin) throws AkuraAppException {

        return userLoginDao.searchSystemUserByUserNameAndRole(userLogin);
    }
    
    /**
     * {@inheritDoc}
     */
    public UserLogin findUserLogin(int userLgoinId) throws AkuraAppException {

        return (UserLogin) userLoginDao.findById(UserLogin.class, userLgoinId);
    }
    
    /**
     * {@inheritDoc}
     */
    public UserRole findUserRole(int userRoleId) throws AkuraAppException {

        return (UserRole) userRoleDao.findById(UserRole.class, userRoleId);
    }
    
    /**
     * {@inheritDoc}
     */
    public UserRole createUserRole(UserRole userRole) throws AkuraAppException {

        return userRoleDao.save(userRole);
    }
    
    /**
     * {@inheritDoc}
     */
    public void updateUserRole(UserRole userRole) throws AkuraAppException {

        userRoleDao.update(userRole);
        
    }
    
    /**
     * {@inheritDoc}
     */
    public void deleteUserRole(UserRole userRole) throws AkuraAppException {

        userRoleDao.delete(userRole);
        
    }
    
    /**
     * {@inheritDoc}
     */
    @Transactional()
    public void grantOrRevokePrivileges(UserRole userRole, List<Privilege> privileges, List<Tab> tabs)
            throws AkuraAppException {

        List<RoleTab> roleTabsList = new ArrayList<RoleTab>();
        List<RolePrivilege> rolePrivilegesList = new ArrayList<RolePrivilege>();
        
        RoleTab roleTab = null;
        RolePrivilege rolePrivilege = null;
        
        /* delete all the RoleTab records related to the given user role. */
        roleTabDao.deleteRoleTabsByUserRole(userRole);
        
        /* delete all the RolePrivileges records related to the given user role. */
        rolePrivilegeDao.deleteRolePrivilegesByUserRole(userRole);
        
        /* Insert Privileges list of RolePrivilege records related to the given user role. */
        for (Privilege privilege : privileges) {
            rolePrivilege = new RolePrivilege();
            rolePrivilege.setRole(userRole);
            rolePrivilege.setPrivilege(privilege);
            rolePrivilegesList.add(rolePrivilege);
        }
        
        /* create a list of rolePrivileges and call saveList() */
        rolePrivilegeDao.saveOrUpdateAll(rolePrivilegesList);
        
        /* Insert Tab list of RoleTab records related to the given user role. */
        for (Tab tab : tabs) {
            roleTab = new RoleTab();
            roleTab.setRole(userRole);
            roleTab.setTab(tab);
            roleTabsList.add(roleTab);
        }
        
        /* create a list of roleTabs and call saveList() */
        roleTabDao.saveOrUpdateAll(roleTabsList);
        
    }
    
    /**
     * Get all the Modules as a list.
     * 
     * @return list of modules.
     * @throws AkuraAppException when fails.
     */
    public List<Module> getAllModules() throws AkuraAppException {

        return moduleDao.findAll(Module.class);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<Privilege> getPrivilegesByUserRole(UserRole userRole) throws AkuraAppException {

        return rolePrivilegeDao.getPrivilegesByUserRole(userRole);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<Tab> getTabsByUserRole(UserRole userRole) throws AkuraAppException {

        return roleTabDao.getTabsByUserRole(userRole);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<RolePrivilege> getRolePrivilegesByUserRole(UserRole userRole) throws AkuraAppException {

        return rolePrivilegeDao.getRolePrivilegesByUserRole(userRole);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<Privilege> getDependenciesList(List<Integer> privilegeIdList) throws AkuraAppException {

        return privilegeDependencyDao.getDependenciesList(privilegeIdList);
    }
    
    /**
     * {@inheritDoc}
     */
    public List<Tab> getDependenciesTabIdList(List<Integer> privilegeIdList) throws AkuraAppException {

        return privilegeDependencyDao.getDependenciesTabIdList(privilegeIdList);
        
    }
    
    /**
     * {@inheritDoc}
     */
    public int isValidationIdentificationNo(int userRoleId, String identificationNo) throws AkuraAppException {

        String query = null;
        
        if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
            query = IS_VALIDATION_IDENTIFICATION_NO_FOR_STAFF;
        } else if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()) {
            query = IS_VALIDATION_IDENTIFICATION_NO_FOR_STUDENT;
        } else if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_PARENT.getUserRoleId()) {
            query = IS_VALIDATION_IDENTIFICATION_NO_FOR_PARENT;
        }
        
        return userLoginDao.isValidationIdentificationNo(query, identificationNo);
        
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean isExistingIdentificationNo(int userRoleId, String identificationNo) throws AkuraAppException {

        String query = null;
        
        if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
            query = IS_EXISTING_IDENTIFICATION_NO_FOR_STAFF;
        } else if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()) {
            query = IS_EXISTING_IDENTIFICATION_NO_FOR_STUDENT;
        } else if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_PARENT.getUserRoleId()) {
            query = IS_EXISTING_IDENTIFICATION_NO_FOR_PARENT;
        }
        
        return userLoginDao.isExistingIdentificationNo(query, identificationNo, userRoleId);
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean isPastUser(int userRoleId, String identificationNo) throws AkuraAppException {

        String query = null;
        
        if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_CLERICALSTAFF.getUserRoleId()
                || userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_TEACHER.getUserRoleId()) {
            query = IS_PAST_STAFF;
        }
        
        return query != null ? userLoginDao.isPastUser(query, identificationNo) : false;
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean isClassTeacher(int userLoginId, Date year, int classGradeId) throws AkuraAppException {

        return userLoginDao.getClassTeacherIdList(userLoginId, year, classGradeId).isEmpty() ? false : true;
    }
    
    /**
     * {@inheritDoc}
     */
    public boolean isNonCurrentStudent(int userRoleId, String identificationNo) throws AkuraAppException {

        String query = null;
        
        if (userRoleId == com.virtusa.akura.api.enums.UserRole.ROLE_STUDENT.getUserRoleId()) {
            query = IS_NON_CURRENT_STUDENT;
        }
        
        return query != null ? userLoginDao.isNonCurrentStudent(query, identificationNo) : false;
    }
}
