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

USE `akura`;

--
-- Add Country code values for relavant country in COUNTRY table.
--

LOCK TABLES `COUNTRY` WRITE;
/*!40000 ALTER TABLE `COUNTRY` DISABLE KEYS */;
UPDATE COUNTRY SET `COUNTRY_CODE`='AF' WHERE `COUNTRY_NAME`='Afghanistan';
UPDATE COUNTRY SET `COUNTRY_CODE`='AL' WHERE `COUNTRY_NAME`='Albaniaaa';
UPDATE COUNTRY SET `COUNTRY_CODE`='DZ' WHERE `COUNTRY_NAME`='Algeria';
UPDATE COUNTRY SET `COUNTRY_CODE`='AD' WHERE `COUNTRY_NAME`='Andorra';
UPDATE COUNTRY SET `COUNTRY_CODE`='AO' WHERE `COUNTRY_NAME`='Angola';
UPDATE COUNTRY SET `COUNTRY_CODE`='ZR' WHERE `COUNTRY_NAME`='Zaire';
UPDATE COUNTRY SET `COUNTRY_CODE`='US' WHERE `COUNTRY_NAME`='United States';
UPDATE COUNTRY SET `COUNTRY_CODE`='AR' WHERE `COUNTRY_NAME`='Argentina';
UPDATE COUNTRY SET `COUNTRY_CODE`='CX' WHERE `COUNTRY_NAME`='Christmas Island';
UPDATE COUNTRY SET `COUNTRY_CODE`='AT' WHERE `COUNTRY_NAME`='Austria';
UPDATE COUNTRY SET `COUNTRY_CODE`='AZ' WHERE `COUNTRY_NAME`='Azerbaijan';
UPDATE COUNTRY SET `COUNTRY_CODE`='BH' WHERE `COUNTRY_NAME`='Bahrain';
UPDATE COUNTRY SET `COUNTRY_CODE`='BD' WHERE `COUNTRY_NAME`='Bangladesh';
UPDATE COUNTRY SET `COUNTRY_CODE`='BY' WHERE `COUNTRY_NAME`='Belarus';
UPDATE COUNTRY SET `COUNTRY_CODE`='BE' WHERE `COUNTRY_NAME`='Belgium';
UPDATE COUNTRY SET `COUNTRY_CODE`='BZ' WHERE `COUNTRY_NAME`='Belize';
UPDATE COUNTRY SET `COUNTRY_CODE`='BJ' WHERE `COUNTRY_NAME`='Benin';
UPDATE COUNTRY SET `COUNTRY_CODE`='BT' WHERE `COUNTRY_NAME`='Bhutan';
UPDATE COUNTRY SET `COUNTRY_CODE`='BO' WHERE `COUNTRY_NAME`='Bolivia';
UPDATE COUNTRY SET `COUNTRY_CODE`='BW' WHERE `COUNTRY_NAME`='Botswana';
UPDATE COUNTRY SET `COUNTRY_CODE`='BR' WHERE `COUNTRY_NAME`='Brazil';
UPDATE COUNTRY SET `COUNTRY_CODE`='IO' WHERE `COUNTRY_NAME`='BritishIndianOcean';
UPDATE COUNTRY SET `COUNTRY_CODE`='BN' WHERE `COUNTRY_NAME`='BruneiDarussalam';
UPDATE COUNTRY SET `COUNTRY_CODE`='BG' WHERE `COUNTRY_NAME`='Bulgaria';
UPDATE COUNTRY SET `COUNTRY_CODE`='BF' WHERE `COUNTRY_NAME`='BurkinaFaso';
UPDATE COUNTRY SET `COUNTRY_CODE`='BI' WHERE `COUNTRY_NAME`='Burundi';
UPDATE COUNTRY SET `COUNTRY_CODE`='KH' WHERE `COUNTRY_NAME`='Cambodia';
UPDATE COUNTRY SET `COUNTRY_CODE`='CM' WHERE `COUNTRY_NAME`='Cameroon';
UPDATE COUNTRY SET `COUNTRY_CODE`='CF' WHERE `COUNTRY_NAME`='CentralAfrica';
UPDATE COUNTRY SET `COUNTRY_CODE`='TD' WHERE `COUNTRY_NAME`='Chad';
UPDATE COUNTRY SET `COUNTRY_CODE`='CL' WHERE `COUNTRY_NAME`='Chile';
UPDATE COUNTRY SET `COUNTRY_CODE`='CN' WHERE `COUNTRY_NAME`='China';
UPDATE COUNTRY SET `COUNTRY_CODE`='CO' WHERE `COUNTRY_NAME`='Colombia';
UPDATE COUNTRY SET `COUNTRY_CODE`='CG' WHERE `COUNTRY_NAME`='Congo';
UPDATE COUNTRY SET `COUNTRY_CODE`='CK' WHERE `COUNTRY_NAME`='CookIslands';
UPDATE COUNTRY SET `COUNTRY_CODE`='CR' WHERE `COUNTRY_NAME`='CostaRica';
UPDATE COUNTRY SET `COUNTRY_CODE`='HR' WHERE `COUNTRY_NAME`='Croatia';
UPDATE COUNTRY SET `COUNTRY_CODE`='CU' WHERE `COUNTRY_NAME`='Cuba';
UPDATE COUNTRY SET `COUNTRY_CODE`='CY' WHERE `COUNTRY_NAME`='Cyprus';
UPDATE COUNTRY SET `COUNTRY_CODE`='CZ' WHERE `COUNTRY_NAME`='CzechRepublic';
UPDATE COUNTRY SET `COUNTRY_CODE`='DK' WHERE `COUNTRY_NAME`='Denmark';
UPDATE COUNTRY SET `COUNTRY_CODE`='DJ' WHERE `COUNTRY_NAME`='Djibouti';
UPDATE COUNTRY SET `COUNTRY_CODE`='EC' WHERE `COUNTRY_NAME`='Ecuador';
UPDATE COUNTRY SET `COUNTRY_CODE`='EG' WHERE `COUNTRY_NAME`='Egypt';
UPDATE COUNTRY SET `COUNTRY_CODE`='GQ' WHERE `COUNTRY_NAME`='EquatorialGuinea';
UPDATE COUNTRY SET `COUNTRY_CODE`='EE' WHERE `COUNTRY_NAME`='Estonia';
UPDATE COUNTRY SET `COUNTRY_CODE`='ET' WHERE `COUNTRY_NAME`='Ethiopia';
UPDATE COUNTRY SET `COUNTRY_CODE`='FK' WHERE `COUNTRY_NAME`='FalklandIslands';
UPDATE COUNTRY SET `COUNTRY_CODE`='FJ' WHERE `COUNTRY_NAME`='Fiji';
UPDATE COUNTRY SET `COUNTRY_CODE`='FI' WHERE `COUNTRY_NAME`='Finland';
UPDATE COUNTRY SET `COUNTRY_CODE`='FR' WHERE `COUNTRY_NAME`='France';
UPDATE COUNTRY SET `COUNTRY_CODE`='PF' WHERE `COUNTRY_NAME`='FrenchPolynesia';
UPDATE COUNTRY SET `COUNTRY_CODE`='GA' WHERE `COUNTRY_NAME`='Gabon';
UPDATE COUNTRY SET `COUNTRY_CODE`='GM' WHERE `COUNTRY_NAME`='Gambia';
UPDATE COUNTRY SET `COUNTRY_CODE`='DE' WHERE `COUNTRY_NAME`='Germany';
UPDATE COUNTRY SET `COUNTRY_CODE`='GI' WHERE `COUNTRY_NAME`='Gibraltar';
UPDATE COUNTRY SET `COUNTRY_CODE`='GR' WHERE `COUNTRY_NAME`='Greece';
UPDATE COUNTRY SET `COUNTRY_CODE`='GL' WHERE `COUNTRY_NAME`='Greenland';
UPDATE COUNTRY SET `COUNTRY_CODE`='GT' WHERE `COUNTRY_NAME`='Guatemala';
UPDATE COUNTRY SET `COUNTRY_CODE`='GN' WHERE `COUNTRY_NAME`='Guinea';
UPDATE COUNTRY SET `COUNTRY_CODE`='GW' WHERE `COUNTRY_NAME`='GuineaBissau';
UPDATE COUNTRY SET `COUNTRY_CODE`='GY' WHERE `COUNTRY_NAME`='Guyana';
UPDATE COUNTRY SET `COUNTRY_CODE`='HT' WHERE `COUNTRY_NAME`='Haiti';
UPDATE COUNTRY SET `COUNTRY_CODE`='HN' WHERE `COUNTRY_NAME`='Honduras';
UPDATE COUNTRY SET `COUNTRY_CODE`='HK' WHERE `COUNTRY_NAME`='HongKong';
UPDATE COUNTRY SET `COUNTRY_CODE`='HU' WHERE `COUNTRY_NAME`='Hungary';
UPDATE COUNTRY SET `COUNTRY_CODE`='IS' WHERE `COUNTRY_NAME`='Iceland';
UPDATE COUNTRY SET `COUNTRY_CODE`='IN' WHERE `COUNTRY_NAME`='India';
UPDATE COUNTRY SET `COUNTRY_CODE`='IR' WHERE `COUNTRY_NAME`='Iran';
UPDATE COUNTRY SET `COUNTRY_CODE`='IQ' WHERE `COUNTRY_NAME`='Iraq';
UPDATE COUNTRY SET `COUNTRY_CODE`='IE' WHERE `COUNTRY_NAME`='Ireland';
UPDATE COUNTRY SET `COUNTRY_CODE`='IL' WHERE `COUNTRY_NAME`='Israel';
UPDATE COUNTRY SET `COUNTRY_CODE`='IT' WHERE `COUNTRY_NAME`='Italy';
UPDATE COUNTRY SET `COUNTRY_CODE`='CI' WHERE `COUNTRY_NAME`='IvoryCoast';
UPDATE COUNTRY SET `COUNTRY_CODE`='JP' WHERE `COUNTRY_NAME`='Japan';
UPDATE COUNTRY SET `COUNTRY_CODE`='JO' WHERE `COUNTRY_NAME`='Jordan';
UPDATE COUNTRY SET `COUNTRY_CODE`='KZ' WHERE `COUNTRY_NAME`='Kazakhstan';
UPDATE COUNTRY SET `COUNTRY_CODE`='KE' WHERE `COUNTRY_NAME`='Kenya';
UPDATE COUNTRY SET `COUNTRY_CODE`='KI' WHERE `COUNTRY_NAME`='Kiribati';
UPDATE COUNTRY SET `COUNTRY_CODE`='KW' WHERE `COUNTRY_NAME`='Kuwait';			
UPDATE COUNTRY SET `COUNTRY_CODE`='LA' WHERE `COUNTRY_NAME`='Laos';					
UPDATE COUNTRY SET `COUNTRY_CODE`='LV' WHERE `COUNTRY_NAME`='Latvia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='LB' WHERE `COUNTRY_NAME`='Lebanon';				
UPDATE COUNTRY SET `COUNTRY_CODE`='LS' WHERE `COUNTRY_NAME`='Lesotho';					
UPDATE COUNTRY SET `COUNTRY_CODE`='LR' WHERE `COUNTRY_NAME`='Liberia';					
UPDATE COUNTRY SET `COUNTRY_CODE`='LY' WHERE `COUNTRY_NAME`='Libya';			
UPDATE COUNTRY SET `COUNTRY_CODE`='LI' WHERE `COUNTRY_NAME`='Liechtenstein';					
UPDATE COUNTRY SET `COUNTRY_CODE`='LT' WHERE `COUNTRY_NAME`='Lithuania';					
UPDATE COUNTRY SET `COUNTRY_CODE`='LU' WHERE `COUNTRY_NAME`='Luxembourg';					
UPDATE COUNTRY SET `COUNTRY_CODE`='MO' WHERE `COUNTRY_NAME`='Macao';			
UPDATE COUNTRY SET `COUNTRY_CODE`='MK' WHERE `COUNTRY_NAME`='Macedonia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MG' WHERE `COUNTRY_NAME`='Madagascar';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MW' WHERE `COUNTRY_NAME`='Malawi';					
UPDATE COUNTRY SET `COUNTRY_CODE`='MY' WHERE `COUNTRY_NAME`='Malaysia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MV' WHERE `COUNTRY_NAME`='Maldives';				
UPDATE COUNTRY SET `COUNTRY_CODE`='ML' WHERE `COUNTRY_NAME`='Mali';					
UPDATE COUNTRY SET `COUNTRY_CODE`='MT' WHERE `COUNTRY_NAME`='Malta';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MR' WHERE `COUNTRY_NAME`='Mauritania';					
UPDATE COUNTRY SET `COUNTRY_CODE`='MU' WHERE `COUNTRY_NAME`='Mauritius';					
UPDATE COUNTRY SET `COUNTRY_CODE`='YT' WHERE `COUNTRY_NAME`='Mayotte';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MX' WHERE `COUNTRY_NAME`='Mexico';					
UPDATE COUNTRY SET `COUNTRY_CODE`='FM' WHERE `COUNTRY_NAME`='Micronesia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MC' WHERE `COUNTRY_NAME`='Monaco';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MN' WHERE `COUNTRY_NAME`='Mongolia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='EH' WHERE `COUNTRY_NAME`='WesternSahara';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MZ' WHERE `COUNTRY_NAME`='Mozambique';				
UPDATE COUNTRY SET `COUNTRY_CODE`='MM' WHERE `COUNTRY_NAME`='Myanmar';					
UPDATE COUNTRY SET `COUNTRY_CODE`='NA' WHERE `COUNTRY_NAME`='Namibia';					
UPDATE COUNTRY SET `COUNTRY_CODE`='NR' WHERE `COUNTRY_NAME`='Nauru';							
UPDATE COUNTRY SET `COUNTRY_CODE`='NP' WHERE `COUNTRY_NAME`='Nepal';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NL' WHERE `COUNTRY_NAME`='Netherlands';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NZ' WHERE `COUNTRY_NAME`='NewZealand';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NI' WHERE `COUNTRY_NAME`='Nicaragua';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NE' WHERE `COUNTRY_NAME`='Niger';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NU' WHERE `COUNTRY_NAME`='Niue';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NF' WHERE `COUNTRY_NAME`='NorfolkIsland';					
UPDATE COUNTRY SET `COUNTRY_CODE`='KP' WHERE `COUNTRY_NAME`='North Korea';				
UPDATE COUNTRY SET `COUNTRY_CODE`='NO' WHERE `COUNTRY_NAME`='Norway';				
UPDATE COUNTRY SET `COUNTRY_CODE`='OM' WHERE `COUNTRY_NAME`='Oman';				
UPDATE COUNTRY SET `COUNTRY_CODE`='PK' WHERE `COUNTRY_NAME`='Pakistan';					
UPDATE COUNTRY SET `COUNTRY_CODE`='PA' WHERE `COUNTRY_NAME`='Panama';					
UPDATE COUNTRY SET `COUNTRY_CODE`='PG' WHERE `COUNTRY_NAME`='PapuaNewGuinea';				
UPDATE COUNTRY SET `COUNTRY_CODE`='PY' WHERE `COUNTRY_NAME`='Paraguay';					
UPDATE COUNTRY SET `COUNTRY_CODE`='PE' WHERE `COUNTRY_NAME`='Peru';				
UPDATE COUNTRY SET `COUNTRY_CODE`='PH' WHERE `COUNTRY_NAME`='Philippines';				
UPDATE COUNTRY SET `COUNTRY_CODE`='PL' WHERE `COUNTRY_NAME`='Poland';					
UPDATE COUNTRY SET `COUNTRY_CODE`='PT' WHERE `COUNTRY_NAME`='Portugal';					
UPDATE COUNTRY SET `COUNTRY_CODE`='QA' WHERE `COUNTRY_NAME`='Qatar';					
UPDATE COUNTRY SET `COUNTRY_CODE`='RO' WHERE `COUNTRY_NAME`='Romania';				
UPDATE COUNTRY SET `COUNTRY_CODE`='RW' WHERE `COUNTRY_NAME`='Rwanda';				
UPDATE COUNTRY SET `COUNTRY_CODE`='SA' WHERE `COUNTRY_NAME`='Saudi Arabia';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SN' WHERE `COUNTRY_NAME`='Senegal';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SC' WHERE `COUNTRY_NAME`='Seychelles';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SL' WHERE `COUNTRY_NAME`='SierraLeone';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SG' WHERE `COUNTRY_NAME`='Singapore';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SB' WHERE `COUNTRY_NAME`='SolomonIslands';							
UPDATE COUNTRY SET `COUNTRY_CODE`='SO' WHERE `COUNTRY_NAME`='Somalia';				
UPDATE COUNTRY SET `COUNTRY_CODE`='ZA' WHERE `COUNTRY_NAME`='South Africa';				
UPDATE COUNTRY SET `COUNTRY_CODE`='KR' WHERE `COUNTRY_NAME`='South Korea';					
UPDATE COUNTRY SET `COUNTRY_CODE`='ES' WHERE `COUNTRY_NAME`='Spain';				
UPDATE COUNTRY SET `COUNTRY_CODE`='LK' WHERE `COUNTRY_NAME`='Sri Lanka';				
UPDATE COUNTRY SET `COUNTRY_CODE`='SD' WHERE `COUNTRY_NAME`='Sudan';					
UPDATE COUNTRY SET `COUNTRY_CODE`='SR' WHERE `COUNTRY_NAME`='Suriname';				
UPDATE COUNTRY SET `COUNTRY_CODE`='SZ' WHERE `COUNTRY_NAME`='Swaziland';				
UPDATE COUNTRY SET `COUNTRY_CODE`='SE' WHERE `COUNTRY_NAME`='Sweden';								
UPDATE COUNTRY SET `COUNTRY_CODE`='CH' WHERE `COUNTRY_NAME`='Switzerland';						
UPDATE COUNTRY SET `COUNTRY_CODE`='SY' WHERE `COUNTRY_NAME`='Syria';						
UPDATE COUNTRY SET `COUNTRY_CODE`='TW' WHERE `COUNTRY_NAME`='Taiwan';					
UPDATE COUNTRY SET `COUNTRY_CODE`='TJ' WHERE `COUNTRY_NAME`='Tajikistan';					
UPDATE COUNTRY SET `COUNTRY_CODE`='TZ' WHERE `COUNTRY_NAME`='Tanzania';					
UPDATE COUNTRY SET `COUNTRY_CODE`='TH' WHERE `COUNTRY_NAME`='Thailand';					
UPDATE COUNTRY SET `COUNTRY_CODE`='TG' WHERE `COUNTRY_NAME`='Togo';
UPDATE COUNTRY SET `COUNTRY_CODE`='TK' WHERE `COUNTRY_NAME`='Tokelau';										
UPDATE COUNTRY SET `COUNTRY_CODE`='TO' WHERE `COUNTRY_NAME`='Tonga';										
UPDATE COUNTRY SET `COUNTRY_CODE`='TN' WHERE `COUNTRY_NAME`='Tunisia';										
UPDATE COUNTRY SET `COUNTRY_CODE`='TM' WHERE `COUNTRY_NAME`='Turkmenistan';										
UPDATE COUNTRY SET `COUNTRY_CODE`='TV' WHERE `COUNTRY_NAME`='Tuvalu';
UPDATE COUNTRY SET `COUNTRY_CODE`='UG' WHERE `COUNTRY_NAME`='Uganda';
UPDATE COUNTRY SET `COUNTRY_CODE`='UA' WHERE `COUNTRY_NAME`='Ukraine';										
UPDATE COUNTRY SET `COUNTRY_CODE`='AE' WHERE `COUNTRY_NAME`='United Arab Emirates';										
UPDATE COUNTRY SET `COUNTRY_CODE`='UY' WHERE `COUNTRY_NAME`='Uruguay';									
UPDATE COUNTRY SET `COUNTRY_CODE`='UZ' WHERE `COUNTRY_NAME`='Uzbekistan';						
UPDATE COUNTRY SET `COUNTRY_CODE`='VU' WHERE `COUNTRY_NAME`='Vanuatu';
UPDATE COUNTRY SET `COUNTRY_CODE`='VA' WHERE `COUNTRY_NAME`='VaticanCityState';
UPDATE COUNTRY SET `COUNTRY_CODE`='VE' WHERE `COUNTRY_NAME`='Venezuela';
UPDATE COUNTRY SET `COUNTRY_CODE`='YE' WHERE `COUNTRY_NAME`='Yemen';
UPDATE COUNTRY SET `COUNTRY_CODE`='ZM' WHERE `COUNTRY_NAME`='Zambia';
UPDATE COUNTRY SET `COUNTRY_CODE`='ZW' WHERE `COUNTRY_NAME`='Zimbabwe';

/*!40000 ALTER TABLE `COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;
