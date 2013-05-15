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

package com.virtusa.akura.common.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.virtusa.akura.api.dto.MethodOfTravel;
import com.virtusa.akura.common.AkuraWebConstant;
import com.virtusa.akura.util.ValidatorExpressionUtil;

/**
 * This is a Validator for MethodOfTravel object which validates property description is null/empty and it
 * should contain only alphabet characters and space between words.
 *
 * @author Virtusa Corporation
 */
public class MethodOfTravelValidator implements Validator {

    /** Constant to represent regex expression define in ValidatorExpression.properties. */
    private static final String REFERENCE_METHODOFTRAVEL_VALIDATOR = "REFERENCE.METHODOFTRAVEL.VALIDATOR";

    /** the field name to check. */
    private static final String FIELD_NAME = "travelMethod";

    /** the common field name to check. */
    private static final String COMMON_FIELD_NAME = "travelId";

    /** attribute for holding empty character. */
    private static final String STRING_EMPTY = "";

    /**
     * MethodOfTravel is the class of the actual object instance that is to be validated.
     *
     * @param clazz - the Class that this Validator is being asked if it can validate
     * @return - true if this Validator can indeed validate instances of the supplied clazz
     */
    public boolean supports(Class<?> clazz) {

        return MethodOfTravel.class.isAssignableFrom(clazz);
    }

    /**
     * Validate the supplied object.
     *
     * @param object - the object that is to be validated
     * @param errors - contextual state about the validation process
     */
    public void validate(Object object, Errors errors) {

        MethodOfTravel methodOfTravel = (MethodOfTravel) object;

        if (STRING_EMPTY.equals(methodOfTravel.getTravelMethod().trim())) {
            errors.rejectValue(COMMON_FIELD_NAME, AkuraWebConstant.MANDATORY_FIELD_ERROR_CODE);
        }

        Pattern stringOnly =
                Pattern.compile(ValidatorExpressionUtil.getValidatorPattern(REFERENCE_METHODOFTRAVEL_VALIDATOR));
        Matcher makeMatch = stringOnly.matcher(methodOfTravel.getTravelMethod());
        if (makeMatch.find()) {
            errors.rejectValue(FIELD_NAME, AkuraWebConstant.MISMATCH_ERROR);
        }
    }

}
