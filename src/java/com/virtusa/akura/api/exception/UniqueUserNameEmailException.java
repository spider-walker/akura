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

package com.virtusa.akura.api.exception;

/**
 * This represents a customized exception class for application specific exceptions.
 * 
 * @author Virtusa Corporation
 */
public class UniqueUserNameEmailException extends AkuraException {
    
    /**
     * Class serial id.
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * The default constructor for UniqueUserNameEmailException.
     */
    public UniqueUserNameEmailException() {

        super();
    }
    
    /**
     * Constructor for UniqueUserNameEmailException with string error message, error code and cause.
     * 
     * @param cause - The cause of the exception.
     * @param strErrorMsg - the specific error message.
     * @param errCode - The specific error code
     */
    public UniqueUserNameEmailException(String strErrorMsg, String errCode, Throwable cause) {

        super(strErrorMsg, errCode, cause);
    }
    
    /**
     * Constructor for UniqueUserNameEmailException with string error code and cause.
     * 
     * @param cause - The cause of the exception.
     * @param errCode - The specific error code
     */
    public UniqueUserNameEmailException(String errCode, Throwable cause) {

        super(errCode, cause);
    }
    
    /**
     * Constructor for UniqueUserNameEmailException with string error code.
     * 
     * @param errCode - The specific error code
     */
    public UniqueUserNameEmailException(String errCode) {

        super(errCode);
    }
}
