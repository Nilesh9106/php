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


