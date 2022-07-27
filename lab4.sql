create table sales_master(
    salesman_no varchar(6) CONSTRAINT s_no PRIMARY KEY CHECK(salesman_no like 's%'),
    sal_name varchar(20) NOT NULL,
    address1 varchar(30) not null,
    address2 varchar(30) not null,
    city varchar(20) ,
    state varchar(20),
    pincode number(6),
    sal_amt number(8,2) not null check(sal_amt > 0),
    tgt_to_get number(6,2) not null check(tgt_to_get > 0),
    ytd_sales number (6,2) not null ,
    remarks varchar(60)
);
create table sales_order(
    s_order_no VARCHAR2(6) PRIMARY KEY check(s_order_no like '0%'),
    order_date DATE NOT NULL,
    client_no varchar2(6) REFERENCES client_master(client_no),
    dely_add varchar2(25),
    salesman_no varchar2(6) REFERENCES sales_master(salesman_no),
    dely_type char(1) default 'F' check(dely_type in ('F','P') ),
    bill_yn char(1) ,
    dely_date DATE,
    order_status varchar2(10) ,
    check(dely_date>order_date),
    check(order_status in ('in process','fulfilled','back order','cancelled'))
);
CREATE TABLE sales_order_details(
    s_order_no varchar2(6) REFERENCES sales_order(s_order_no),
    product_no varchar2(6) REFERENCES product_master(product_no),
    qty_order number(8) ,
    qty_disp number(8) ,
    product_rate number(10,2)
);
INSERT INTO sales_master (salesman_no,sal_name,ADDRESS1,ADDRESS2,CITY,PINCODE,STATE,sal_amt,tgt_to_get,ytd_sales,remarks) VALUES ('&salesman_no','&NAME','&ADDRESS1','&ADDRESS2','&CITY',&PINCODE,'&STATE',&sal_amt,&tgt_to_get,&ytd_sales,'&remarks');

INSERT INTO SALES_ORDER (s_order_no,order_date,client_no,dely_add,salesman_no,dely_type,bill_yn,dely_date,order_status) VALUES ('&s_order_no','&order_date','&client_no','&dely_add','&salesman_no','&dely_type','&bill_yn','&dely_date','&order_status');

--------------------------------------------------------
--  File created - Wednesday-July-27-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SALES_MASTER
--------------------------------------------------------

  CREATE TABLE "CE3_21"."SALES_MASTER" 
   (	"SALESMAN_NO" VARCHAR2(6 BYTE), 
	"SAL_NAME" VARCHAR2(20 BYTE), 
	"ADDRESS1" VARCHAR2(30 BYTE), 
	"ADDRESS2" VARCHAR2(30 BYTE), 
	"CITY" VARCHAR2(20 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"PINCODE" NUMBER(6,0), 
	"SAL_AMT" NUMBER(8,2), 
	"TGT_TO_GET" NUMBER(6,2), 
	"YTD_SALES" NUMBER(6,2), 
	"REMARKS" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into CE3_21.SALES_MASTER
SET DEFINE OFF;
Insert into CE3_21.SALES_MASTER (SALESMAN_NO,SAL_NAME,ADDRESS1,ADDRESS2,CITY,STATE,PINCODE,SAL_AMT,TGT_TO_GET,YTD_SALES,REMARKS) values ('S00001','Aman','A/14','Worli','Mumbai','Maharashtra',400002,3000,100,500,'good');
Insert into CE3_21.SALES_MASTER (SALESMAN_NO,SAL_NAME,ADDRESS1,ADDRESS2,CITY,STATE,PINCODE,SAL_AMT,TGT_TO_GET,YTD_SALES,REMARKS) values ('S00002','Omkar','65','Nariman','Mumbai','Maharashtra',400001,3000,200,100,'good');
Insert into CE3_21.SALES_MASTER (SALESMAN_NO,SAL_NAME,ADDRESS1,ADDRESS2,CITY,STATE,PINCODE,SAL_AMT,TGT_TO_GET,YTD_SALES,REMARKS) values ('S00003','Raj','P-7','Bandra','Mumbai','Maharashtra',400032,3000,200,100,'good');
Insert into CE3_21.SALES_MASTER (SALESMAN_NO,SAL_NAME,ADDRESS1,ADDRESS2,CITY,STATE,PINCODE,SAL_AMT,TGT_TO_GET,YTD_SALES,REMARKS) values ('S00004','Ashish','A/5','Juhu','Mumbai','Maharashtra',400044,3000,200,150,'good');
--------------------------------------------------------
--  DDL for Index S_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "CE3_21"."S_NO" ON "CE3_21"."SALES_MASTER" ("SALESMAN_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SALES_MASTER
--------------------------------------------------------

  ALTER TABLE "CE3_21"."SALES_MASTER" ADD CONSTRAINT "S_NO" PRIMARY KEY ("SALESMAN_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CE3_21"."SALES_MASTER" ADD CHECK (tgt_to_get > 0) ENABLE;
  ALTER TABLE "CE3_21"."SALES_MASTER" ADD CHECK (sal_amt > 0) ENABLE;
  ALTER TABLE "CE3_21"."SALES_MASTER" ADD CONSTRAINT "SYS_C0011929" CHECK (salesman_no like 'S%') ENABLE;
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("YTD_SALES" NOT NULL ENABLE);
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("TGT_TO_GET" NOT NULL ENABLE);
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("SAL_AMT" NOT NULL ENABLE);
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("ADDRESS2" NOT NULL ENABLE);
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("ADDRESS1" NOT NULL ENABLE);
  ALTER TABLE "CE3_21"."SALES_MASTER" MODIFY ("SAL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  File created - Wednesday-July-27-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SALES_ORDER
--------------------------------------------------------

  CREATE TABLE "CE3_21"."SALES_ORDER" 
   (	"S_ORDER_NO" VARCHAR2(6 BYTE), 
	"ORDER_DATE" DATE, 
	"CLIENT_NO" VARCHAR2(6 BYTE), 
	"DELY_ADD" VARCHAR2(25 BYTE), 
	"SALESMAN_NO" VARCHAR2(6 BYTE), 
	"DELY_TYPE" CHAR(1 BYTE) DEFAULT 'F', 
	"BILL_YN" CHAR(1 BYTE), 
	"DELY_DATE" DATE, 
	"ORDER_STATUS" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into CE3_21.SALES_ORDER
SET DEFINE OFF;
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O19001',to_date('12-JAN-96','DD-MON-RR'),'0001',null,'S00001','F','N',to_date('20-JAN-96','DD-MON-RR'),'in process');
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O19002',to_date('25-JAN-96','DD-MON-RR'),'0002',null,'S00002','P','N',to_date('27-JAN-96','DD-MON-RR'),'cancelled');
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O16865',to_date('18-FEB-96','DD-MON-RR'),'0003',null,'S00003','F','Y',to_date('20-FEB-96','DD-MON-RR'),'fulfilled');
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O19003',to_date('03-APR-96','DD-MON-RR'),'0001',null,'S00001','F','Y',to_date('07-APR-96','DD-MON-RR'),'fulfilled');
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O46866',to_date('20-MAY-96','DD-MON-RR'),'0004',null,'S00002','P','N',to_date('22-MAY-96','DD-MON-RR'),'cancelled');
Insert into CE3_21.SALES_ORDER (S_ORDER_NO,ORDER_DATE,CLIENT_NO,DELY_ADD,SALESMAN_NO,DELY_TYPE,BILL_YN,DELY_DATE,ORDER_STATUS) values ('O10008',to_date('24-MAY-96','DD-MON-RR'),'0005',null,'S00004','F','N',to_date('26-MAY-96','DD-MON-RR'),'in process');
--------------------------------------------------------
--  DDL for Index SYS_C0011963
--------------------------------------------------------

  CREATE UNIQUE INDEX "CE3_21"."SYS_C0011963" ON "CE3_21"."SALES_ORDER" ("S_ORDER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SALES_ORDER
--------------------------------------------------------

  ALTER TABLE "CE3_21"."SALES_ORDER" ADD PRIMARY KEY ("S_ORDER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CE3_21"."SALES_ORDER" ADD CHECK (order_status in ('in process','fulfilled','back order','cancelled')) ENABLE;
  ALTER TABLE "CE3_21"."SALES_ORDER" ADD CHECK (dely_date>order_date) ENABLE;
  ALTER TABLE "CE3_21"."SALES_ORDER" ADD CHECK (dely_type in ('F','P') ) ENABLE;
  ALTER TABLE "CE3_21"."SALES_ORDER" ADD CONSTRAINT "SYS_C0011959" CHECK (s_order_no like 'O%') ENABLE;
  ALTER TABLE "CE3_21"."SALES_ORDER" MODIFY ("ORDER_DATE" NOT NULL ENABLE);

