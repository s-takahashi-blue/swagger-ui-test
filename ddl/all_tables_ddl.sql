--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.users (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    description character varying(65535),
    image_thumb1 character varying(100),
    image_file1 character varying(100),
    latitude character varying(12),
    longitude character varying(12),
    password character varying(255),
    tmp_password character varying(255),
    num_login bigint,
    num_signin_error smallint,
    signin_error_time timestamp without time zone,
    last_updated timestamp without time zone,
    flag_notice_mail smallint,
    role character varying(6) NOT NULL,
    status character varying(9) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    failed_attempts integer NOT NULL,
    locked_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    last_sign_in_ip character varying(255),
    current_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    sign_in_count integer,
    first_name character varying(100),
    company_name character varying(100),
    department character varying(100),
    job_title character varying(100),
    phone_number character varying(20)
);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: crm_users; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.crm_users (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    name2 character varying(150),
    name_kana character varying(150),
    name_kana2 character varying(150),
    new_membership smallint,
    email character varying(255) NOT NULL,
    password character varying(255),
    tmp_password character varying(255),
    tmp_password_expired timestamp without time zone,
    master_key character varying(255),
    company character varying(255),
    industry character varying(32),
    department character varying(255),
    title character varying(20),
    title_text character varying(255),
    phone_number character varying(20),
    zipcode character varying(7),
    prefecture_id bigint,
    address character varying(255),
    address_detail character varying(255),
    building character varying(255),
    url character varying(255),
    remarks character varying(65535),
    campaign_applied smallint,
    online_status character varying(20),
    online_registered_at timestamp without time zone,
    online_confirmed_at timestamp without time zone,
    allows_face_to_face smallint,
    user_id bigint,
    flag_filtered character varying(1) NOT NULL,
    crm_status character varying(20) NOT NULL,
    status_updated_at timestamp without time zone,
    regist_way character varying(20),
    inquiry_id bigint,
    last_tracked_log_id bigint,
    last_tracked timestamp without time zone,
    flag_permission character varying(1) NOT NULL,
    has_invalid_email smallint NOT NULL,
    stop_mail_groups character varying(255) NOT NULL,
    num_login integer,
    num_signin_error integer,
    signin_error_time timestamp without time zone,
    user_hash character varying(32),
    status character varying(11) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    last_sign_in_ip character varying(255),
    current_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    sign_in_count integer NOT NULL,
    unconfirmed_email character varying(255),
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    failed_attempts integer NOT NULL,
    locked_at timestamp without time zone,
    satori_hashcode character varying(20),
    satori_message character varying(255)
);


--
-- Name: crm_users crm_users_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.crm_users
    ADD CONSTRAINT crm_users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: inquiries; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.inquiries (
    id bigint NOT NULL,
    master_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    inquiry_form_id bigint NOT NULL,
    page_id integer,
    client_id integer,
    client_type character varying(10),
    company character varying(255) NOT NULL,
    company_kana character varying(255),
    department character varying(255) NOT NULL,
    title character varying(255),
    "1st_name" character varying(90) NOT NULL,
    "2nd_name" character varying(90) NOT NULL,
    "1st_name_kana" character varying(90),
    "2nd_name_kana" character varying(90),
    industry character varying(10),
    industry_text character varying(90),
    postal_code character varying(10),
    prefecture_id bigint,
    address character varying(255),
    address_detail character varying(255),
    building character varying(255),
    email character varying(255),
    tel character varying(20),
    fax character varying(20),
    flag_newsletter character varying(1),
    flag_alert character varying(1),
    inq_type character varying(20),
    inq_services character varying(20),
    inq_services_text character varying(255),
    property_id character varying(24),
    space_id character varying(10),
    properties character varying(65535),
    property_url character varying(255),
    property_name character varying(255),
    property_postal_code character varying(8),
    property_prefecture_id bigint,
    property_address character varying(255),
    property_area character varying(255),
    property_area_cd character varying(12),
    property_size character varying(10),
    feature_id bigint,
    flag_overseas character varying(1),
    search_prefecture_id bigint,
    search_area character varying(255),
    search_station character varying(255),
    search_station_minute character varying(2),
    search_ic character varying(255),
    search_ic_distance character varying(2),
    search_property_type character varying(2),
    search_property_type_text character varying(255),
    search_use character varying(255),
    search_use_text character varying(255),
    acquisition_motive character varying(2),
    acquisition_motive_text character varying(255),
    disposition_motive character varying(2),
    disposition_motive_text character varying(255),
    investments_period character varying(2),
    search_size_fr bigint,
    search_size_to bigint,
    search_size_unit character varying(10),
    search_size_sq_fr bigint,
    search_size_sq_to bigint,
    search_price_unit_fr bigint,
    search_price_unit_to bigint,
    search_price_total_fr bigint,
    search_price_total_to bigint,
    search_flag_buy character varying(1),
    moving_period character varying(255),
    person_in_charge character varying(255),
    note character varying(65535),
    comment character varying(65535),
    mail_group character varying(100),
    youken character varying(60),
    oj_q1 character varying(60),
    oj_q2 character varying(60),
    oj_q3 character varying(60),
    oj_q4 character varying(60),
    oj_q5 character varying(60),
    oj_q6 character varying(60),
    oj_q7 character varying(60),
    oj_q8 character varying(60),
    oj_q9 character varying(60),
    oj_q10 character varying(60),
    newsletter character varying(60),
    company_new character varying(255),
    "1st_name_new" character varying(60),
    "2nd_name_new" character varying(60),
    email_new character varying(255),
    brochure character varying(60),
    people character varying(60),
    date character varying(60),
    "time" character varying(60),
    event_time character varying(60),
    free character varying(60),
    flag_free smallint,
    route character varying(60),
    registration_flag smallint,
    contact_date timestamp without time zone NOT NULL,
    ip_address character varying(15) NOT NULL,
    user_agent character varying(255) NOT NULL,
    satori_hashcode character varying(20),
    satori_message character varying(255),
    status character varying(1) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: inquiries inquiries_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: inquiry_forms; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.inquiry_forms (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    form_key character varying(20) NOT NULL,
    "column" character varying(65535) NOT NULL,
    column2 character varying(65535) NOT NULL,
    title_alt character varying(255) NOT NULL,
    title_sub character varying(255) NOT NULL,
    title_sub2 character varying(255) NOT NULL,
    lead_text character varying(65535) NOT NULL,
    remarks character varying(65535) NOT NULL,
    flag_property_table2 character varying(1) NOT NULL,
    mail_lead character varying(65535) NOT NULL,
    mail_flag_content character varying(1) NOT NULL,
    mail_body character varying(65535) NOT NULL,
    mail_signature character varying(65535) NOT NULL,
    form_tag character varying(65535),
    confirm_tag character varying(65535),
    conversion_tag character varying(65535) NOT NULL,
    conversion_html character varying(65535) NOT NULL,
    alt_emails character varying(255),
    default_crm_status character varying(20),
    registration_flag smallint,
    list_order bigint NOT NULL,
    status character varying(1) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: inquiry_forms inquiry_forms_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.inquiry_forms
    ADD CONSTRAINT inquiry_forms_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: items; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.items (
    id bigint NOT NULL,
    master_id bigint NOT NULL,
    property_id character varying(24) NOT NULL,
    title character varying(255) NOT NULL,
    area_cd bigint,
    prefecture_id bigint NOT NULL,
    address_pref character varying(12),
    address_city character varying(100),
    address character varying(255) NOT NULL,
    address_detail character varying(30),
    address_raw character varying(255),
    is_address_hidden smallint NOT NULL,
    description character varying(65535),
    route1 bigint,
    route2 bigint,
    route3 bigint,
    station1 bigint,
    station2 bigint,
    station3 bigint,
    walk_minute1 character varying(30),
    walk_minute2 character varying(30),
    walk_minute3 character varying(30),
    structure character varying(90),
    completion_date bigint,
    floor_height integer,
    floor_height_to integer,
    total_rent_area_tsubo character varying(10),
    total_rent_area_square character varying(10),
    property_note character varying(255),
    icon character varying(65535),
    contents character varying(65535),
    image_file1 character varying(100),
    image_file1_t character varying(100),
    image_file1_da character varying(1) NOT NULL,
    image_file2 character varying(100),
    image_file2_t character varying(100),
    image_file2_da character varying(1) NOT NULL,
    image_file3 character varying(100),
    image_file3_t character varying(100),
    image_file3_da character varying(1) NOT NULL,
    image_file4 character varying(100),
    image_file4_t character varying(100),
    image_file4_da character varying(1) NOT NULL,
    image_file5 character varying(100),
    image_file5_t character varying(100),
    image_file5_da character varying(1) NOT NULL,
    image_file6 character varying(100),
    image_file6_t character varying(100),
    image_file6_da character varying(1) NOT NULL,
    image_file7 character varying(100),
    image_file7_t character varying(100),
    image_file7_da character varying(1) NOT NULL,
    image_file8 character varying(100),
    image_file8_t character varying(100),
    image_file8_da smallint NOT NULL,
    image_file9 character varying(100),
    image_file9_t character varying(100),
    image_file9_da smallint NOT NULL,
    image_file10 character varying(100),
    image_file10_t character varying(100),
    image_file10_da smallint NOT NULL,
    image_file11 character varying(100),
    image_file11_t character varying(100),
    image_file11_da smallint NOT NULL,
    image_file12 character varying(100),
    image_file12_t character varying(100),
    image_file12_da smallint NOT NULL,
    image_file13 character varying(100),
    image_file13_t character varying(100),
    image_file13_da smallint NOT NULL,
    image_file14 character varying(100),
    image_file14_t character varying(100),
    image_file14_da smallint NOT NULL,
    image_file15 character varying(100),
    image_file15_t character varying(100),
    image_file15_da smallint NOT NULL,
    image_file16 character varying(100),
    image_file16_t character varying(100),
    image_file16_da smallint NOT NULL,
    image_file17 character varying(100),
    image_file17_t character varying(100),
    image_file17_da smallint NOT NULL,
    image_file18 character varying(100),
    image_file18_t character varying(100),
    image_file18_da smallint NOT NULL,
    image_file19 character varying(100),
    image_file19_t character varying(100),
    image_file19_da smallint NOT NULL,
    image_file20 character varying(100),
    image_file20_t character varying(100),
    image_file20_da smallint NOT NULL,
    image_file21 character varying(100),
    image_file21_t character varying(100),
    image_file21_da smallint NOT NULL,
    image_file22 character varying(100),
    image_file22_t character varying(100),
    image_file22_da smallint NOT NULL,
    image_file23 character varying(100),
    image_file23_t character varying(100),
    image_file23_da smallint NOT NULL,
    image_file24 character varying(100),
    image_file24_t character varying(100),
    image_file24_da smallint NOT NULL,
    image_file25 character varying(100),
    image_file25_t character varying(100),
    image_file25_da smallint NOT NULL,
    image_file26 character varying(100),
    image_file26_t character varying(100),
    image_file26_da smallint NOT NULL,
    image_file27 character varying(100),
    image_file27_t character varying(100),
    image_file27_da smallint NOT NULL,
    image_file28 character varying(100),
    image_file28_t character varying(100),
    image_file28_da smallint NOT NULL,
    image_file29 character varying(100),
    image_file29_t character varying(100),
    image_file29_da smallint NOT NULL,
    image_file30 character varying(100),
    image_file30_t character varying(100),
    image_file30_da smallint NOT NULL,
    caption1 character varying(120),
    caption2 character varying(120),
    caption3 character varying(120),
    caption4 character varying(120),
    caption5 character varying(120),
    caption6 character varying(120),
    caption7 character varying(120),
    caption8 character varying(120),
    caption9 character varying(120),
    caption10 character varying(120),
    caption11 character varying(120),
    caption12 character varying(120),
    caption13 character varying(120),
    caption14 character varying(120),
    caption15 character varying(120),
    caption16 character varying(120),
    caption17 character varying(120),
    caption18 character varying(120),
    caption19 character varying(120),
    caption20 character varying(120),
    caption21 character varying(120),
    caption22 character varying(120),
    caption23 character varying(120),
    caption24 character varying(120),
    caption25 character varying(120),
    caption26 character varying(120),
    caption27 character varying(120),
    caption28 character varying(120),
    caption29 character varying(120),
    caption30 character varying(120),
    image_info character varying(65535),
    spacely_url1 character varying(255),
    spacely_url2 character varying(255),
    spacely_url3 character varying(255),
    video_url1 character varying(255),
    video_url2 character varying(255),
    video_url3 character varying(255),
    video_caption1 character varying(100),
    video_caption2 character varying(100),
    video_caption3 character varying(100),
    latitude numeric(10,7),
    longitude numeric(10,7),
    deal_type character varying(10) NOT NULL,
    interior_type character varying(255),
    page_title character varying(255),
    sales_copy character varying(255),
    outline character varying(65535),
    remarks character varying(65535),
    capacity character varying(255),
    campaign_started_at timestamp without time zone,
    campaign_finished_at timestamp without time zone,
    expired_at timestamp without time zone,
    contact_note character varying(255),
    flag_listing character varying(1) NOT NULL,
    flag_appearance character varying(1) NOT NULL,
    flag_csv_upload character varying(1) NOT NULL,
    sum_space_size_tsubo bigint,
    sum_space_size_square bigint,
    contact_id integer,
    status character varying(1) NOT NULL,
    last_modified timestamp without time zone,
    last_modified_user bigint,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: rooms; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.rooms (
    id bigint NOT NULL,
    master_id bigint NOT NULL,
    item_id bigint NOT NULL,
    space_id bigint,
    space_definition character varying(1) NOT NULL,
    space_class character varying(1),
    floor character varying(30),
    space_size_tsubo character varying(10) NOT NULL,
    space_size_square character varying(10) NOT NULL,
    space_size_note character varying(2),
    has_ambiguous_size integer,
    rent_pattern character varying(1) NOT NULL,
    rent_tax bigint,
    rent bigint,
    rent_note character varying(2),
    rent_total bigint,
    cam_pattern character varying(1),
    cam_tax bigint,
    cam bigint,
    cam_note character varying(2),
    cam_total integer,
    fee bigint,
    fee_total bigint,
    contract_type character varying(1),
    contract_term bigint,
    available_date character varying(8),
    available_note character varying(2),
    brokerage_type character varying(2),
    space_note character varying(255),
    icon character varying(255),
    contents character varying(65535),
    image_file1 character varying(100),
    image_file1_t character varying(100),
    image_file1_da character varying(1) NOT NULL,
    image_file2 character varying(100),
    image_file2_t character varying(100),
    image_file2_da character varying(1) NOT NULL,
    image_file3 character varying(100),
    image_file3_t character varying(100),
    image_file3_da character varying(1) NOT NULL,
    image_file4 character varying(100),
    image_file4_t character varying(100),
    image_file4_da character varying(1) NOT NULL,
    image_file5 character varying(100),
    image_file5_t character varying(100),
    image_file5_da character varying(1) NOT NULL,
    image_file6 character varying(100),
    image_file6_t character varying(100),
    image_file6_da character varying(1) NOT NULL,
    image_file7 character varying(100),
    image_file7_t character varying(100),
    image_file7_da character varying(1) NOT NULL,
    image_file8 character varying(100),
    image_file8_t character varying(100),
    image_file8_da smallint NOT NULL,
    image_file9 character varying(100),
    image_file9_t character varying(100),
    image_file9_da smallint NOT NULL,
    image_file10 character varying(100),
    image_file10_t character varying(100),
    image_file10_da smallint NOT NULL,
    image_file11 character varying(100),
    image_file11_t character varying(100),
    image_file11_da smallint NOT NULL,
    image_file12 character varying(100),
    image_file12_t character varying(100),
    image_file12_da smallint NOT NULL,
    image_file13 character varying(100),
    image_file13_t character varying(100),
    image_file13_da smallint NOT NULL,
    image_file14 character varying(100),
    image_file14_t character varying(100),
    image_file14_da smallint NOT NULL,
    image_file15 character varying(100),
    image_file15_t character varying(100),
    image_file15_da smallint NOT NULL,
    image_file16 character varying(100),
    image_file16_t character varying(100),
    image_file16_da smallint NOT NULL,
    image_file17 character varying(100),
    image_file17_t character varying(100),
    image_file17_da smallint NOT NULL,
    image_file18 character varying(100),
    image_file18_t character varying(100),
    image_file18_da smallint NOT NULL,
    image_file19 character varying(100),
    image_file19_t character varying(100),
    image_file19_da smallint NOT NULL,
    image_file20 character varying(100),
    image_file20_t character varying(100),
    image_file20_da smallint NOT NULL,
    image_file21 character varying(100),
    image_file21_t character varying(100),
    image_file21_da smallint NOT NULL,
    image_file22 character varying(100),
    image_file22_t character varying(100),
    image_file22_da smallint NOT NULL,
    image_file23 character varying(100),
    image_file23_t character varying(100),
    image_file23_da smallint NOT NULL,
    image_file24 character varying(100),
    image_file24_t character varying(100),
    image_file24_da smallint NOT NULL,
    image_file25 character varying(100),
    image_file25_t character varying(100),
    image_file25_da smallint NOT NULL,
    image_file26 character varying(100),
    image_file26_t character varying(100),
    image_file26_da smallint NOT NULL,
    image_file27 character varying(100),
    image_file27_t character varying(100),
    image_file27_da smallint NOT NULL,
    image_file28 character varying(100),
    image_file28_t character varying(100),
    image_file28_da smallint NOT NULL,
    image_file29 character varying(100),
    image_file29_t character varying(100),
    image_file29_da smallint NOT NULL,
    image_file30 character varying(100),
    image_file30_t character varying(100),
    image_file30_da smallint NOT NULL,
    caption1 character varying(120),
    caption2 character varying(120),
    caption3 character varying(120),
    caption4 character varying(120),
    caption5 character varying(120),
    caption6 character varying(120),
    caption7 character varying(120),
    caption8 character varying(120),
    caption9 character varying(120),
    caption10 character varying(120),
    caption11 character varying(120),
    caption12 character varying(120),
    caption13 character varying(120),
    caption14 character varying(120),
    caption15 character varying(120),
    caption16 character varying(120),
    caption17 character varying(120),
    caption18 character varying(120),
    caption19 character varying(120),
    caption20 character varying(120),
    caption21 character varying(120),
    caption22 character varying(120),
    caption23 character varying(120),
    caption24 character varying(120),
    caption25 character varying(120),
    caption26 character varying(120),
    caption27 character varying(120),
    caption28 character varying(120),
    caption29 character varying(120),
    caption30 character varying(120),
    image_info character varying(65535),
    dept_cd character varying(10),
    contact_id integer,
    is_dummy smallint NOT NULL,
    flag_private character varying(1) NOT NULL,
    flag_listing character varying(1) NOT NULL,
    flag_agent character varying(1),
    flag_recommend character varying(1),
    flag_csv_upload character varying(1),
    flag_auto_delete character varying(1),
    flag_update character varying(1),
    flag_elasticsearch smallint,
    status character varying(1) NOT NULL,
    expired_at timestamp without time zone,
    last_updated timestamp without time zone,
    last_modified timestamp without time zone,
    last_modified_user bigint,
    is_online_brokerage smallint NOT NULL,
    company_id integer,
    is_negotiable smallint NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: pages; Type: TABLE; Schema: xgate; Owner: -
--

CREATE TABLE xgate.pages (
    id bigint NOT NULL,
    page_key character varying(200) NOT NULL,
    page_group_id bigint NOT NULL,
    parent_id bigint NOT NULL,
    title character varying(255),
    title_short character varying(60),
    page_type character varying(4),
    case_flag smallint,
    keywords character varying(255),
    description character varying(255),
    column_value character varying(65535),
    content text,
    options character varying(255),
    image_file character varying(100),
    url character varying(255),
    flag_new_window character varying(1) NOT NULL,
    page_view_file character varying(20),
    master_key character varying(100),
    category character varying(255),
    area_key character varying(255),
    dept_cd character varying(4),
    pubdate timestamp without time zone,
    expired timestamp without time zone,
    property_id character varying(24),
    form_key character varying(20),
    static_content_type character varying(20),
    flag_use_form character varying(1) NOT NULL,
    additional_js character varying(255),
    additional_css character varying(255),
    list_order bigint,
    status character varying(1) NOT NULL,
    mt_category character varying(255),
    mt_blog character varying(255),
    mt_version character varying(20),
    mt_blog_id bigint,
    mt_entry_id bigint,
    mt_category_id bigint,
    mt_status character varying(10),
    flag_display_list character varying(1) NOT NULL,
    flag_member_only character varying(1) NOT NULL,
    flag_hide_date smallint,
    flag_noindex smallint,
    flag_ad smallint,
    flag_update character varying(1) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    modified_freezed timestamp without time zone
);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: xgate; Owner: -
--

ALTER TABLE ONLY xgate.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

