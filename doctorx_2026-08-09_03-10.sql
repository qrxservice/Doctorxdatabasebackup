--
-- PostgreSQL database dump
--

\restrict cCrgX7scwC54UwLan1Uq2ObacWieAXUKrIZTu63K6LdnAz9V4W4vlXqXB7G1BDC

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: doctorx
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO doctorx;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_otp_codes; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.admin_otp_codes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    method text DEFAULT 'email'::text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    used boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.admin_otp_codes OWNER TO doctorx;

--
-- Name: admin_otp_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.admin_otp_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_otp_codes_id_seq OWNER TO doctorx;

--
-- Name: admin_otp_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.admin_otp_codes_id_seq OWNED BY public.admin_otp_codes.id;


--
-- Name: adsense_slots; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.adsense_slots (
    id integer NOT NULL,
    "position" text NOT NULL,
    code text DEFAULT ''::text NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.adsense_slots OWNER TO doctorx;

--
-- Name: adsense_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.adsense_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adsense_slots_id_seq OWNER TO doctorx;

--
-- Name: adsense_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.adsense_slots_id_seq OWNED BY public.adsense_slots.id;


--
-- Name: advertisements; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.advertisements (
    id integer NOT NULL,
    title text NOT NULL,
    image_url text NOT NULL,
    link_url text,
    location text DEFAULT 'homepage_middle'::text NOT NULL,
    custom_width integer,
    custom_height integer,
    desktop_width integer,
    desktop_height integer,
    mobile_width integer,
    mobile_height integer,
    target_countries text,
    target_divisions text,
    priority integer DEFAULT 0 NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    is_active boolean DEFAULT true NOT NULL,
    impressions integer DEFAULT 0 NOT NULL,
    clicks integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.advertisements OWNER TO doctorx;

--
-- Name: advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.advertisements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.advertisements_id_seq OWNER TO doctorx;

--
-- Name: advertisements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.advertisements_id_seq OWNED BY public.advertisements.id;


--
-- Name: ambulance_drivers; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.ambulance_drivers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    profile_photo text,
    date_of_birth text,
    address text,
    nid_number text,
    nid_photo text,
    nid_back_photo text,
    selfie_photo text,
    licence_number text,
    licence_photo text,
    licence_expiry text,
    division text,
    district text,
    upazila text,
    service_radius integer DEFAULT 20,
    approval_status text DEFAULT 'pending'::text NOT NULL,
    approval_note text,
    approved_by integer,
    approved_at timestamp with time zone,
    online_status text DEFAULT 'offline'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    total_trips integer DEFAULT 0 NOT NULL,
    total_earnings integer DEFAULT 0 NOT NULL,
    avg_rating real,
    rating_count integer DEFAULT 0 NOT NULL,
    plan_name text,
    plan_status text,
    plan_start_date timestamp with time zone,
    plan_end_date timestamp with time zone,
    auto_renew boolean DEFAULT false,
    wallet_balance integer DEFAULT 0 NOT NULL,
    verification_status text DEFAULT 'unverified'::text NOT NULL,
    gps_enabled boolean DEFAULT true NOT NULL,
    last_active_at timestamp with time zone,
    commission_rate real,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ambulance_drivers OWNER TO doctorx;

--
-- Name: ambulance_drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.ambulance_drivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambulance_drivers_id_seq OWNER TO doctorx;

--
-- Name: ambulance_drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.ambulance_drivers_id_seq OWNED BY public.ambulance_drivers.id;


--
-- Name: ambulance_ratings; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.ambulance_ratings (
    id integer NOT NULL,
    request_id integer NOT NULL,
    user_id integer NOT NULL,
    driver_id integer NOT NULL,
    rating integer NOT NULL,
    review text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ambulance_ratings OWNER TO doctorx;

--
-- Name: ambulance_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.ambulance_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambulance_ratings_id_seq OWNER TO doctorx;

--
-- Name: ambulance_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.ambulance_ratings_id_seq OWNED BY public.ambulance_ratings.id;


--
-- Name: ambulance_requests; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.ambulance_requests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    driver_id integer,
    vehicle_id integer,
    status text DEFAULT 'pending'::text NOT NULL,
    vehicle_type text DEFAULT 'basic'::text NOT NULL,
    is_sos boolean DEFAULT false NOT NULL,
    pickup_lat real NOT NULL,
    pickup_lng real NOT NULL,
    pickup_address text,
    drop_lat real,
    drop_lng real,
    drop_address text,
    patient_name text,
    patient_condition text,
    notes text,
    estimated_fare integer,
    actual_fare integer,
    distance_km real,
    currency text DEFAULT 'BDT'::text NOT NULL,
    cancellation_reason text,
    cancelled_by text,
    requested_at timestamp with time zone DEFAULT now() NOT NULL,
    accepted_at timestamp with time zone,
    arrived_at timestamp with time zone,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ambulance_requests OWNER TO doctorx;

--
-- Name: ambulance_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.ambulance_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambulance_requests_id_seq OWNER TO doctorx;

--
-- Name: ambulance_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.ambulance_requests_id_seq OWNED BY public.ambulance_requests.id;


--
-- Name: ambulance_settings; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.ambulance_settings (
    id integer NOT NULL,
    commission_enabled boolean DEFAULT true NOT NULL,
    commission_rate real DEFAULT 10 NOT NULL,
    subscription_enabled boolean DEFAULT false NOT NULL,
    featured_listing_enabled boolean DEFAULT false NOT NULL,
    driver_verification_fee_enabled boolean DEFAULT false NOT NULL,
    driver_verification_fee_amount integer DEFAULT 0 NOT NULL,
    base_fare_bdt integer DEFAULT 500 NOT NULL,
    per_km_rate_bdt integer DEFAULT 20 NOT NULL,
    offline_timeout_minutes integer DEFAULT 15 NOT NULL,
    request_timeout_seconds integer DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ambulance_settings OWNER TO doctorx;

--
-- Name: ambulance_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.ambulance_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambulance_settings_id_seq OWNER TO doctorx;

--
-- Name: ambulance_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.ambulance_settings_id_seq OWNED BY public.ambulance_settings.id;


--
-- Name: ambulance_vehicles; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.ambulance_vehicles (
    id integer NOT NULL,
    driver_id integer NOT NULL,
    vehicle_type text DEFAULT 'basic'::text NOT NULL,
    registration_number text NOT NULL,
    vehicle_photo text,
    make text,
    model text,
    year text,
    seating_capacity integer,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ambulance_vehicles OWNER TO doctorx;

--
-- Name: ambulance_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.ambulance_vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambulance_vehicles_id_seq OWNER TO doctorx;

--
-- Name: ambulance_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.ambulance_vehicles_id_seq OWNED BY public.ambulance_vehicles.id;


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.app_settings (
    id integer NOT NULL,
    prescription_qr_enabled boolean DEFAULT true NOT NULL,
    notice_text text,
    notice_enabled boolean DEFAULT false NOT NULL,
    hero_image_url text,
    hero_overlay_color text DEFAULT '#0f172a'::text NOT NULL,
    hero_overlay_opacity integer DEFAULT 40 NOT NULL,
    theme_colors_enabled boolean DEFAULT false NOT NULL,
    theme_primary_light text,
    theme_primary_dark text,
    theme_bg_light text,
    theme_bg_dark text,
    doctor_card_light text,
    doctor_card_dark text,
    smtp_host text,
    smtp_port integer,
    smtp_user text,
    smtp_password text,
    smtp_from_email text,
    smtp_from_name text,
    smtp_enabled boolean DEFAULT false NOT NULL,
    sms_provider text,
    sms_api_key text,
    sms_sender_id text,
    sms_enabled boolean DEFAULT false NOT NULL,
    shop_enabled boolean DEFAULT true NOT NULL,
    monthly_subscription_fee integer DEFAULT 500 NOT NULL,
    auto_approve_on_payment boolean DEFAULT false NOT NULL,
    manual_payment_enabled boolean DEFAULT true NOT NULL,
    admin_2fa_enabled boolean DEFAULT false NOT NULL,
    admin_2fa_method text DEFAULT 'email'::text NOT NULL,
    admin_2fa_otp_expiry_minutes integer DEFAULT 10 NOT NULL,
    admin_2fa_mobile_api_url text,
    admin_2fa_mobile_api_key text,
    site_logo_url text,
    site_logo_width integer DEFAULT 32 NOT NULL,
    site_logo_height integer DEFAULT 32 NOT NULL,
    favicon_url text,
    footer_logo_url text,
    footer_site_name text,
    footer_tagline text,
    footer_copyright_text text,
    footer_about text,
    donation_enabled boolean DEFAULT false NOT NULL,
    donation_amount integer DEFAULT 100 NOT NULL,
    donation_amount_usd integer DEFAULT 1 NOT NULL,
    donation_message text,
    bdt_tier1_max_years integer DEFAULT 5 NOT NULL,
    bdt_tier1_fee integer DEFAULT 0 NOT NULL,
    bdt_tier2_max_years integer DEFAULT 10 NOT NULL,
    bdt_tier2_fee integer DEFAULT 500 NOT NULL,
    bdt_tier3_fee integer DEFAULT 1000 NOT NULL,
    usd_tier1_max_years integer DEFAULT 5 NOT NULL,
    usd_tier1_fee integer DEFAULT 0 NOT NULL,
    usd_tier2_max_years integer DEFAULT 10 NOT NULL,
    usd_tier2_fee integer DEFAULT 5 NOT NULL,
    usd_tier3_fee integer DEFAULT 10 NOT NULL,
    monthly_subscription_fee_usd integer DEFAULT 5 NOT NULL,
    doctor_template_management_enabled boolean DEFAULT true NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.app_settings OWNER TO doctorx;

--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.app_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_settings_id_seq OWNER TO doctorx;

--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    patient_name text NOT NULL,
    patient_phone text NOT NULL,
    patient_email text,
    patient_age integer,
    patient_gender text,
    complaint text,
    bp text,
    pulse text,
    temp text,
    weight text,
    height text,
    hb text,
    sugar text,
    spo2 text,
    medical_history text,
    notes text,
    lab_report_url text,
    prescription_upload_url text,
    booking_source text DEFAULT 'online'::text NOT NULL,
    appointment_date text NOT NULL,
    appointment_time text,
    serial_no integer NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    tracking_token text,
    confirmation_email_sent boolean DEFAULT false,
    confirmation_sms_status text DEFAULT 'pending'::text,
    donation_paid boolean DEFAULT false NOT NULL,
    donation_amount integer,
    donation_currency text,
    donation_paid_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.appointments OWNER TO doctorx;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO doctorx;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.audit_logs (
    id integer NOT NULL,
    actor_user_id integer,
    actor_role text,
    actor_name text,
    action text NOT NULL,
    entity_type text NOT NULL,
    entity_id integer,
    details text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.audit_logs OWNER TO doctorx;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO doctorx;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: banners; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.banners (
    id integer NOT NULL,
    title text NOT NULL,
    image_url text,
    link_url text,
    description text,
    "position" text DEFAULT 'homepage_top'::text,
    size text DEFAULT 'medium'::text,
    custom_width integer,
    custom_height integer,
    desktop_width integer,
    desktop_height integer,
    mobile_width integer,
    mobile_height integer,
    target_countries text,
    target_divisions text,
    display_order integer DEFAULT 0,
    priority integer DEFAULT 0,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    is_active boolean DEFAULT true NOT NULL,
    impressions integer DEFAULT 0 NOT NULL,
    clicks integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.banners OWNER TO doctorx;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.banners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banners_id_seq OWNER TO doctorx;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.blog_posts (
    id integer NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    excerpt text,
    content text DEFAULT ''::text NOT NULL,
    cover_image_url text,
    author_name text,
    category text,
    tags text,
    seo_title text,
    meta_description text,
    focus_keyword text,
    canonical_url text,
    status text DEFAULT 'draft'::text NOT NULL,
    published_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.blog_posts OWNER TO doctorx;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_posts_id_seq OWNER TO doctorx;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;


--
-- Name: blood_donor_conversations; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.blood_donor_conversations (
    id integer NOT NULL,
    request_id integer NOT NULL,
    requester_id integer NOT NULL,
    donor_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.blood_donor_conversations OWNER TO doctorx;

--
-- Name: blood_donor_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.blood_donor_conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blood_donor_conversations_id_seq OWNER TO doctorx;

--
-- Name: blood_donor_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.blood_donor_conversations_id_seq OWNED BY public.blood_donor_conversations.id;


--
-- Name: blood_donor_messages; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.blood_donor_messages (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    sender_id integer NOT NULL,
    message text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.blood_donor_messages OWNER TO doctorx;

--
-- Name: blood_donor_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.blood_donor_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blood_donor_messages_id_seq OWNER TO doctorx;

--
-- Name: blood_donor_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.blood_donor_messages_id_seq OWNED BY public.blood_donor_messages.id;


--
-- Name: blood_donor_requests; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.blood_donor_requests (
    id integer NOT NULL,
    requester_id integer NOT NULL,
    donor_id integer NOT NULL,
    blood_group text NOT NULL,
    message text,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.blood_donor_requests OWNER TO doctorx;

--
-- Name: blood_donor_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.blood_donor_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blood_donor_requests_id_seq OWNER TO doctorx;

--
-- Name: blood_donor_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.blood_donor_requests_id_seq OWNED BY public.blood_donor_requests.id;


--
-- Name: calculators; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.calculators (
    id integer NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    category text DEFAULT 'general'::text NOT NULL,
    short_description text,
    content text DEFAULT ''::text NOT NULL,
    featured_image_url text,
    seo_title text,
    meta_description text,
    status text DEFAULT 'draft'::text NOT NULL,
    schema_enabled boolean DEFAULT false NOT NULL,
    fields_json jsonb DEFAULT '[]'::jsonb NOT NULL,
    formulas_json jsonb DEFAULT '[]'::jsonb NOT NULL,
    results_json jsonb DEFAULT '[]'::jsonb NOT NULL,
    faqs_json jsonb DEFAULT '[]'::jsonb NOT NULL,
    placements_json jsonb DEFAULT '[]'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.calculators OWNER TO doctorx;

--
-- Name: calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.calculators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calculators_id_seq OWNER TO doctorx;

--
-- Name: calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.calculators_id_seq OWNED BY public.calculators.id;


--
-- Name: chat_conversations; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.chat_conversations (
    id integer NOT NULL,
    doctor1_id integer NOT NULL,
    doctor2_id integer NOT NULL,
    last_message_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.chat_conversations OWNER TO doctorx;

--
-- Name: chat_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.chat_conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_conversations_id_seq OWNER TO doctorx;

--
-- Name: chat_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.chat_conversations_id_seq OWNED BY public.chat_conversations.id;


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    sender_doctor_id integer NOT NULL,
    message text,
    attachment_url text,
    attachment_type text,
    attachment_name text,
    attachment_size integer,
    is_read boolean DEFAULT false,
    is_deleted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.chat_messages OWNER TO doctorx;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_messages_id_seq OWNER TO doctorx;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO doctorx;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO doctorx;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    dial_code text,
    flag text
);


ALTER TABLE public.countries OWNER TO doctorx;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO doctorx;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name text NOT NULL,
    icon text,
    description text
);


ALTER TABLE public.departments OWNER TO doctorx;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO doctorx;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: doctor_availability; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctor_availability (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    day_of_week integer NOT NULL,
    start_time text NOT NULL,
    end_time text NOT NULL,
    break_start text,
    break_end text,
    max_appointments integer DEFAULT 20,
    is_available boolean DEFAULT true
);


ALTER TABLE public.doctor_availability OWNER TO doctorx;

--
-- Name: doctor_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctor_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_availability_id_seq OWNER TO doctorx;

--
-- Name: doctor_availability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctor_availability_id_seq OWNED BY public.doctor_availability.id;


--
-- Name: doctor_connections; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctor_connections (
    id integer NOT NULL,
    requester_doctor_id integer NOT NULL,
    receiver_doctor_id integer NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.doctor_connections OWNER TO doctorx;

--
-- Name: doctor_connections_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctor_connections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_connections_id_seq OWNER TO doctorx;

--
-- Name: doctor_connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctor_connections_id_seq OWNED BY public.doctor_connections.id;


--
-- Name: doctor_consultations; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctor_consultations (
    id integer NOT NULL,
    requester_doctor_id integer NOT NULL,
    consultant_doctor_id integer NOT NULL,
    patient_info text,
    case_notes text NOT NULL,
    attachment_url text,
    attachment_type text,
    attachment_name text,
    attachment_size integer,
    response_notes text,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.doctor_consultations OWNER TO doctorx;

--
-- Name: doctor_consultations_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctor_consultations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_consultations_id_seq OWNER TO doctorx;

--
-- Name: doctor_consultations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctor_consultations_id_seq OWNED BY public.doctor_consultations.id;


--
-- Name: doctor_notices; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctor_notices (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    type text DEFAULT 'general'::text NOT NULL,
    from_date text,
    to_date text,
    from_time text,
    to_time text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.doctor_notices OWNER TO doctorx;

--
-- Name: doctor_notices_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctor_notices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_notices_id_seq OWNER TO doctorx;

--
-- Name: doctor_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctor_notices_id_seq OWNED BY public.doctor_notices.id;


--
-- Name: doctor_rx_settings; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctor_rx_settings (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    header_name text,
    header_degree text,
    header_designation text,
    header_bmdc text,
    hospital_name text,
    header_address text,
    header_phone text,
    header_email text,
    signature_text text,
    signature_image text,
    page_size text DEFAULT 'A4'::text NOT NULL,
    margin_top integer DEFAULT 15 NOT NULL,
    margin_right integer DEFAULT 15 NOT NULL,
    margin_bottom integer DEFAULT 15 NOT NULL,
    margin_left integer DEFAULT 15 NOT NULL,
    header_height integer DEFAULT 25 NOT NULL,
    footer_height integer DEFAULT 15 NOT NULL,
    show_header boolean DEFAULT true NOT NULL,
    show_qr boolean DEFAULT true NOT NULL,
    show_signature boolean DEFAULT true NOT NULL,
    show_footer boolean DEFAULT true NOT NULL,
    footer_text text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.doctor_rx_settings OWNER TO doctorx;

--
-- Name: doctor_rx_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctor_rx_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_rx_settings_id_seq OWNER TO doctorx;

--
-- Name: doctor_rx_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctor_rx_settings_id_seq OWNED BY public.doctor_rx_settings.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    user_id integer,
    name text NOT NULL,
    phone text,
    email text NOT NULL,
    photo_url text,
    degree text,
    department_id integer,
    specialty_id integer,
    location_id integer,
    country_id integer,
    city_id integer,
    timezone text,
    experience integer,
    chamber_address text,
    visiting_time text,
    chamber_address_2 text,
    visiting_time_2 text,
    consultation_fee integer,
    bmdc_number text,
    bmdc_file text,
    bmdc_validity_years integer,
    subscription_fee integer DEFAULT 0,
    currency text DEFAULT 'BDT'::text NOT NULL,
    approval_status text DEFAULT 'pending'::text NOT NULL,
    is_featured boolean DEFAULT false,
    is_senior boolean DEFAULT false,
    is_verified boolean DEFAULT false,
    online_consultation_available boolean DEFAULT false,
    emergency_available boolean DEFAULT false,
    online_status text DEFAULT 'offline'::text,
    break_until timestamp with time zone,
    last_active_at timestamp with time zone,
    about text,
    services text,
    education text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.doctors OWNER TO doctorx;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_id_seq OWNER TO doctorx;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: driver_locations; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.driver_locations (
    id integer NOT NULL,
    driver_id integer NOT NULL,
    lat real NOT NULL,
    lng real NOT NULL,
    heading real,
    speed real,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.driver_locations OWNER TO doctorx;

--
-- Name: driver_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.driver_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_locations_id_seq OWNER TO doctorx;

--
-- Name: driver_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.driver_locations_id_seq OWNED BY public.driver_locations.id;


--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.email_logs (
    id integer NOT NULL,
    recipient_email text NOT NULL,
    subject text NOT NULL,
    body text,
    status text DEFAULT 'pending'::text NOT NULL,
    error_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.email_logs OWNER TO doctorx;

--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.email_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_logs_id_seq OWNER TO doctorx;

--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.email_logs_id_seq OWNED BY public.email_logs.id;


--
-- Name: emergency_blood_requests; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.emergency_blood_requests (
    id integer NOT NULL,
    user_id integer,
    blood_group text NOT NULL,
    quantity text NOT NULL,
    hospital text NOT NULL,
    city text NOT NULL,
    contact_number text NOT NULL,
    notes text,
    status text DEFAULT 'open'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.emergency_blood_requests OWNER TO doctorx;

--
-- Name: emergency_blood_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.emergency_blood_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emergency_blood_requests_id_seq OWNER TO doctorx;

--
-- Name: emergency_blood_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.emergency_blood_requests_id_seq OWNED BY public.emergency_blood_requests.id;


--
-- Name: emergency_contact_reports; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.emergency_contact_reports (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    reason text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.emergency_contact_reports OWNER TO doctorx;

--
-- Name: emergency_contact_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.emergency_contact_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emergency_contact_reports_id_seq OWNER TO doctorx;

--
-- Name: emergency_contact_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.emergency_contact_reports_id_seq OWNED BY public.emergency_contact_reports.id;


--
-- Name: emergency_contacts; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.emergency_contacts (
    id integer NOT NULL,
    category text NOT NULL,
    name text NOT NULL,
    mobile_number text NOT NULL,
    driver_name text,
    vehicle_number text,
    country text DEFAULT 'Bangladesh'::text NOT NULL,
    division text,
    district text,
    upazila text,
    area text,
    notes text,
    availability_status text DEFAULT 'available'::text NOT NULL,
    is_verified boolean DEFAULT false NOT NULL,
    is_priority boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    report_count integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.emergency_contacts OWNER TO doctorx;

--
-- Name: emergency_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.emergency_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emergency_contacts_id_seq OWNER TO doctorx;

--
-- Name: emergency_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.emergency_contacts_id_seq OWNED BY public.emergency_contacts.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name text NOT NULL,
    district text
);


ALTER TABLE public.locations OWNER TO doctorx;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO doctorx;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: medicines; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.medicines (
    id integer NOT NULL,
    brand_name text NOT NULL,
    generic_name text,
    strength text,
    dosage_form text,
    manufacturer text
);


ALTER TABLE public.medicines OWNER TO doctorx;

--
-- Name: medicines_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.medicines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicines_id_seq OWNER TO doctorx;

--
-- Name: medicines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.medicines_id_seq OWNED BY public.medicines.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    label text NOT NULL,
    title_bn text,
    url text DEFAULT '#'::text NOT NULL,
    location text DEFAULT 'header'::text NOT NULL,
    footer_group text,
    menu_type text DEFAULT 'custom'::text NOT NULL,
    visibility text DEFAULT 'public'::text NOT NULL,
    parent_id integer,
    display_order integer DEFAULT 0 NOT NULL,
    open_in_new_tab boolean DEFAULT false NOT NULL,
    is_no_follow boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.menu_items OWNER TO doctorx;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO doctorx;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: migration_batches; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.migration_batches (
    id integer NOT NULL,
    entity_type text NOT NULL,
    file_name text,
    format text,
    total_rows integer DEFAULT 0 NOT NULL,
    imported_rows integer DEFAULT 0 NOT NULL,
    skipped_rows integer DEFAULT 0 NOT NULL,
    status text DEFAULT 'completed'::text NOT NULL,
    created_by_user_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.migration_batches OWNER TO doctorx;

--
-- Name: migration_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.migration_batches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migration_batches_id_seq OWNER TO doctorx;

--
-- Name: migration_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.migration_batches_id_seq OWNED BY public.migration_batches.id;


--
-- Name: migration_records; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.migration_records (
    id integer NOT NULL,
    batch_id integer NOT NULL,
    entity_type text NOT NULL,
    entity_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.migration_records OWNER TO doctorx;

--
-- Name: migration_records_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.migration_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migration_records_id_seq OWNER TO doctorx;

--
-- Name: migration_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.migration_records_id_seq OWNED BY public.migration_records.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type text NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    is_read boolean DEFAULT false,
    related_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notifications OWNER TO doctorx;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO doctorx;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    used boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.password_reset_tokens OWNER TO doctorx;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_reset_tokens_id_seq OWNER TO doctorx;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: patient_referrals; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.patient_referrals (
    id integer NOT NULL,
    referrer_doctor_id integer NOT NULL,
    receiver_doctor_id integer NOT NULL,
    patient_name text NOT NULL,
    patient_phone text,
    patient_age integer,
    patient_gender text,
    referral_reason text NOT NULL,
    notes text,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.patient_referrals OWNER TO doctorx;

--
-- Name: patient_referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.patient_referrals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patient_referrals_id_seq OWNER TO doctorx;

--
-- Name: patient_referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.patient_referrals_id_seq OWNED BY public.patient_referrals.id;


--
-- Name: patient_reviews; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.patient_reviews (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_id integer,
    patient_name text NOT NULL,
    patient_phone text,
    rating integer NOT NULL,
    review_text text,
    is_approved boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.patient_reviews OWNER TO doctorx;

--
-- Name: patient_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.patient_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patient_reviews_id_seq OWNER TO doctorx;

--
-- Name: patient_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.patient_reviews_id_seq OWNED BY public.patient_reviews.id;


--
-- Name: payment_gateways; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.payment_gateways (
    id integer NOT NULL,
    gateway text NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    api_key text,
    secret_key text,
    merchant_id text,
    mode text DEFAULT 'sandbox'::text NOT NULL,
    success_url text,
    failed_url text,
    callback_url text,
    qr_image_url text,
    merchant_name text,
    payment_instructions text,
    success_message text,
    failure_message text,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payment_gateways OWNER TO doctorx;

--
-- Name: payment_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.payment_gateways_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_gateways_id_seq OWNER TO doctorx;

--
-- Name: payment_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.payment_gateways_id_seq OWNED BY public.payment_gateways.id;


--
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.payment_transactions (
    id integer NOT NULL,
    gateway text NOT NULL,
    tran_id text NOT NULL,
    purpose text DEFAULT 'doctor_subscription'::text NOT NULL,
    subscription_id integer,
    doctor_id integer,
    order_id integer,
    months integer,
    amount integer NOT NULL,
    currency text DEFAULT 'BDT'::text NOT NULL,
    status text DEFAULT 'initiated'::text NOT NULL,
    gateway_val_id text,
    gateway_response text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payment_transactions OWNER TO doctorx;

--
-- Name: payment_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.payment_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_transactions_id_seq OWNER TO doctorx;

--
-- Name: payment_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.payment_transactions_id_seq OWNED BY public.payment_transactions.id;


--
-- Name: prescription_items; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.prescription_items (
    id integer NOT NULL,
    prescription_id integer NOT NULL,
    medicine_id integer,
    medicine_name text NOT NULL,
    generic_name text,
    strength text,
    dosage_form text,
    dose text,
    duration text,
    meal_timing text,
    instruction text
);


ALTER TABLE public.prescription_items OWNER TO doctorx;

--
-- Name: prescription_items_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.prescription_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prescription_items_id_seq OWNER TO doctorx;

--
-- Name: prescription_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.prescription_items_id_seq OWNED BY public.prescription_items.id;


--
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.prescriptions (
    id integer NOT NULL,
    reference_no text,
    status text DEFAULT 'final'::text NOT NULL,
    doctor_id integer NOT NULL,
    appointment_id integer,
    patient_name text NOT NULL,
    patient_phone text,
    patient_age integer,
    patient_gender text,
    patient_weight text,
    patient_height text,
    chief_complaint text,
    vitals text,
    examination text,
    diagnosis text,
    investigations text,
    advice text,
    follow_up_date text,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.prescriptions OWNER TO doctorx;

--
-- Name: prescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.prescriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prescriptions_id_seq OWNER TO doctorx;

--
-- Name: prescriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.prescriptions_id_seq OWNED BY public.prescriptions.id;


--
-- Name: queue_display_devices; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.queue_display_devices (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    name text NOT NULL,
    display_type text DEFAULT 'tv'::text NOT NULL,
    width integer,
    height integer,
    font_size integer DEFAULT 100 NOT NULL,
    layout_size integer DEFAULT 100 NOT NULL,
    fullscreen boolean DEFAULT true NOT NULL,
    orientation text DEFAULT 'landscape'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    show_patient_name boolean DEFAULT true NOT NULL,
    show_doctor_name boolean DEFAULT true NOT NULL,
    voice_enabled boolean DEFAULT false NOT NULL,
    voice_language text DEFAULT 'en'::text NOT NULL,
    theme text DEFAULT 'dark'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.queue_display_devices OWNER TO doctorx;

--
-- Name: queue_display_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.queue_display_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.queue_display_devices_id_seq OWNER TO doctorx;

--
-- Name: queue_display_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.queue_display_devices_id_seq OWNED BY public.queue_display_devices.id;


--
-- Name: queue_entries; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.queue_entries (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_id integer,
    patient_name text NOT NULL,
    patient_phone text,
    serial_no integer NOT NULL,
    status text DEFAULT 'waiting'::text NOT NULL,
    queue_date text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.queue_entries OWNER TO doctorx;

--
-- Name: queue_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.queue_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.queue_entries_id_seq OWNER TO doctorx;

--
-- Name: queue_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.queue_entries_id_seq OWNED BY public.queue_entries.id;


--
-- Name: rx_templates; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.rx_templates (
    id integer NOT NULL,
    doctor_id integer,
    type text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    department text,
    is_favorite boolean DEFAULT false,
    is_hidden boolean DEFAULT false,
    is_builtin boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.rx_templates OWNER TO doctorx;

--
-- Name: rx_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.rx_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rx_templates_id_seq OWNER TO doctorx;

--
-- Name: rx_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.rx_templates_id_seq OWNED BY public.rx_templates.id;


--
-- Name: shop_cart; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.shop_cart (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.shop_cart OWNER TO doctorx;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.shop_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_cart_id_seq OWNER TO doctorx;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.shop_cart_id_seq OWNED BY public.shop_cart.id;


--
-- Name: shop_order_items; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.shop_order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price_at_purchase numeric(10,2) NOT NULL
);


ALTER TABLE public.shop_order_items OWNER TO doctorx;

--
-- Name: shop_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.shop_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_order_items_id_seq OWNER TO doctorx;

--
-- Name: shop_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.shop_order_items_id_seq OWNED BY public.shop_order_items.id;


--
-- Name: shop_orders; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.shop_orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    payment_status text DEFAULT 'unpaid'::text NOT NULL,
    payment_method text,
    total_amount numeric(10,2) NOT NULL,
    qr_transaction_id text,
    qr_screenshot_url text,
    shipping_name text,
    shipping_phone text,
    shipping_address text,
    shipping_city text,
    notes text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.shop_orders OWNER TO doctorx;

--
-- Name: shop_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.shop_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_orders_id_seq OWNER TO doctorx;

--
-- Name: shop_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.shop_orders_id_seq OWNED BY public.shop_orders.id;


--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.shop_products (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    original_price numeric(10,2),
    category text DEFAULT 'general'::text NOT NULL,
    image_url text,
    stock_qty integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_featured boolean DEFAULT false NOT NULL,
    rating numeric(3,2) DEFAULT '0'::numeric,
    review_count integer DEFAULT 0 NOT NULL,
    tags text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.shop_products OWNER TO doctorx;

--
-- Name: shop_products_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.shop_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_products_id_seq OWNER TO doctorx;

--
-- Name: shop_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.shop_products_id_seq OWNED BY public.shop_products.id;


--
-- Name: shop_wishlist; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.shop_wishlist (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.shop_wishlist OWNER TO doctorx;

--
-- Name: shop_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.shop_wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_wishlist_id_seq OWNER TO doctorx;

--
-- Name: shop_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.shop_wishlist_id_seq OWNED BY public.shop_wishlist.id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.sliders (
    id integer NOT NULL,
    title text NOT NULL,
    image_url text,
    link_url text,
    button_text text,
    description text,
    "position" text DEFAULT 'hero'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    priority integer DEFAULT 0 NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    auto_play boolean DEFAULT true NOT NULL,
    slide_interval integer DEFAULT 5000 NOT NULL,
    show_arrows boolean DEFAULT true NOT NULL,
    show_dots boolean DEFAULT true NOT NULL,
    desktop_width integer,
    desktop_height integer,
    mobile_width integer,
    mobile_height integer,
    tablet_width integer,
    tablet_height integer,
    custom_width integer,
    custom_height integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sliders OWNER TO doctorx;

--
-- Name: sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sliders_id_seq OWNER TO doctorx;

--
-- Name: sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.sliders_id_seq OWNED BY public.sliders.id;


--
-- Name: sms_logs; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.sms_logs (
    id integer NOT NULL,
    phone text NOT NULL,
    message text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    provider text,
    error_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sms_logs OWNER TO doctorx;

--
-- Name: sms_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.sms_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sms_logs_id_seq OWNER TO doctorx;

--
-- Name: sms_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.sms_logs_id_seq OWNED BY public.sms_logs.id;


--
-- Name: specialties; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.specialties (
    id integer NOT NULL,
    name text NOT NULL,
    department_id integer
);


ALTER TABLE public.specialties OWNER TO doctorx;

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.specialties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specialties_id_seq OWNER TO doctorx;

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.specialties_id_seq OWNED BY public.specialties.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    bmdc_validity_years integer,
    fee integer DEFAULT 0 NOT NULL,
    months integer,
    monthly_fee integer,
    currency text DEFAULT 'BDT'::text NOT NULL,
    payment_status text DEFAULT 'unpaid'::text NOT NULL,
    start_date text,
    end_date text,
    status text DEFAULT 'inactive'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO doctorx;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO doctorx;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: tool_categories; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.tool_categories (
    id integer NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tool_categories OWNER TO doctorx;

--
-- Name: tool_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.tool_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tool_categories_id_seq OWNER TO doctorx;

--
-- Name: tool_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.tool_categories_id_seq OWNED BY public.tool_categories.id;


--
-- Name: tool_favorites; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.tool_favorites (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    tool_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tool_favorites OWNER TO doctorx;

--
-- Name: tool_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.tool_favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tool_favorites_id_seq OWNER TO doctorx;

--
-- Name: tool_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.tool_favorites_id_seq OWNED BY public.tool_favorites.id;


--
-- Name: tool_usage; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.tool_usage (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    tool_id integer NOT NULL,
    used_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tool_usage OWNER TO doctorx;

--
-- Name: tool_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.tool_usage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tool_usage_id_seq OWNER TO doctorx;

--
-- Name: tool_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.tool_usage_id_seq OWNED BY public.tool_usage.id;


--
-- Name: tools; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.tools (
    id integer NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    type text DEFAULT 'html-tool'::text NOT NULL,
    category_id integer,
    department text DEFAULT 'all'::text NOT NULL,
    short_description text,
    featured_image_url text,
    icon text,
    status text DEFAULT 'draft'::text NOT NULL,
    version text DEFAULT '1.0'::text NOT NULL,
    html_code text DEFAULT ''::text NOT NULL,
    css_code text DEFAULT ''::text NOT NULL,
    js_code text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tools OWNER TO doctorx;

--
-- Name: tools_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.tools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tools_id_seq OWNER TO doctorx;

--
-- Name: tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.tools_id_seq OWNED BY public.tools.id;


--
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.user_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    label text DEFAULT 'Home'::text NOT NULL,
    recipient_name text NOT NULL,
    phone text NOT NULL,
    alt_phone text,
    country text,
    division text,
    district text,
    upazila text,
    postal_code text,
    full_address text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_addresses OWNER TO doctorx;

--
-- Name: user_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.user_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_addresses_id_seq OWNER TO doctorx;

--
-- Name: user_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.user_addresses_id_seq OWNED BY public.user_addresses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    name text,
    role text DEFAULT 'patient'::text NOT NULL,
    doctor_id integer,
    phone text,
    date_of_birth text,
    gender text,
    blood_group text,
    address text,
    country text,
    division text,
    district text,
    area text,
    profile_picture text,
    emergency_contact text,
    nationality text,
    preferred_language text,
    is_donor text DEFAULT 'false'::text,
    donor_status text DEFAULT 'inactive'::text,
    last_donation_date text,
    permissions text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO doctorx;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO doctorx;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video_promotions; Type: TABLE; Schema: public; Owner: doctorx
--

CREATE TABLE public.video_promotions (
    id integer NOT NULL,
    title text NOT NULL,
    video_url text,
    thumbnail_url text,
    "position" text DEFAULT 'homepage_hero'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    desktop_width integer,
    desktop_height integer,
    mobile_width integer,
    mobile_height integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.video_promotions OWNER TO doctorx;

--
-- Name: video_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: doctorx
--

CREATE SEQUENCE public.video_promotions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.video_promotions_id_seq OWNER TO doctorx;

--
-- Name: video_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doctorx
--

ALTER SEQUENCE public.video_promotions_id_seq OWNED BY public.video_promotions.id;


--
-- Name: admin_otp_codes id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.admin_otp_codes ALTER COLUMN id SET DEFAULT nextval('public.admin_otp_codes_id_seq'::regclass);


--
-- Name: adsense_slots id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.adsense_slots ALTER COLUMN id SET DEFAULT nextval('public.adsense_slots_id_seq'::regclass);


--
-- Name: advertisements id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.advertisements ALTER COLUMN id SET DEFAULT nextval('public.advertisements_id_seq'::regclass);


--
-- Name: ambulance_drivers id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_drivers ALTER COLUMN id SET DEFAULT nextval('public.ambulance_drivers_id_seq'::regclass);


--
-- Name: ambulance_ratings id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_ratings ALTER COLUMN id SET DEFAULT nextval('public.ambulance_ratings_id_seq'::regclass);


--
-- Name: ambulance_requests id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_requests ALTER COLUMN id SET DEFAULT nextval('public.ambulance_requests_id_seq'::regclass);


--
-- Name: ambulance_settings id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_settings ALTER COLUMN id SET DEFAULT nextval('public.ambulance_settings_id_seq'::regclass);


--
-- Name: ambulance_vehicles id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_vehicles ALTER COLUMN id SET DEFAULT nextval('public.ambulance_vehicles_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: blog_posts id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);


--
-- Name: blood_donor_conversations id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_conversations ALTER COLUMN id SET DEFAULT nextval('public.blood_donor_conversations_id_seq'::regclass);


--
-- Name: blood_donor_messages id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_messages ALTER COLUMN id SET DEFAULT nextval('public.blood_donor_messages_id_seq'::regclass);


--
-- Name: blood_donor_requests id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_requests ALTER COLUMN id SET DEFAULT nextval('public.blood_donor_requests_id_seq'::regclass);


--
-- Name: calculators id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.calculators ALTER COLUMN id SET DEFAULT nextval('public.calculators_id_seq'::regclass);


--
-- Name: chat_conversations id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.chat_conversations ALTER COLUMN id SET DEFAULT nextval('public.chat_conversations_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: doctor_availability id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_availability ALTER COLUMN id SET DEFAULT nextval('public.doctor_availability_id_seq'::regclass);


--
-- Name: doctor_connections id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_connections ALTER COLUMN id SET DEFAULT nextval('public.doctor_connections_id_seq'::regclass);


--
-- Name: doctor_consultations id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_consultations ALTER COLUMN id SET DEFAULT nextval('public.doctor_consultations_id_seq'::regclass);


--
-- Name: doctor_notices id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_notices ALTER COLUMN id SET DEFAULT nextval('public.doctor_notices_id_seq'::regclass);


--
-- Name: doctor_rx_settings id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_rx_settings ALTER COLUMN id SET DEFAULT nextval('public.doctor_rx_settings_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: driver_locations id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.driver_locations ALTER COLUMN id SET DEFAULT nextval('public.driver_locations_id_seq'::regclass);


--
-- Name: email_logs id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.email_logs ALTER COLUMN id SET DEFAULT nextval('public.email_logs_id_seq'::regclass);


--
-- Name: emergency_blood_requests id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_blood_requests ALTER COLUMN id SET DEFAULT nextval('public.emergency_blood_requests_id_seq'::regclass);


--
-- Name: emergency_contact_reports id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_contact_reports ALTER COLUMN id SET DEFAULT nextval('public.emergency_contact_reports_id_seq'::regclass);


--
-- Name: emergency_contacts id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_contacts ALTER COLUMN id SET DEFAULT nextval('public.emergency_contacts_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: medicines id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.medicines ALTER COLUMN id SET DEFAULT nextval('public.medicines_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: migration_batches id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.migration_batches ALTER COLUMN id SET DEFAULT nextval('public.migration_batches_id_seq'::regclass);


--
-- Name: migration_records id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.migration_records ALTER COLUMN id SET DEFAULT nextval('public.migration_records_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- Name: patient_referrals id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.patient_referrals ALTER COLUMN id SET DEFAULT nextval('public.patient_referrals_id_seq'::regclass);


--
-- Name: patient_reviews id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.patient_reviews ALTER COLUMN id SET DEFAULT nextval('public.patient_reviews_id_seq'::regclass);


--
-- Name: payment_gateways id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_gateways ALTER COLUMN id SET DEFAULT nextval('public.payment_gateways_id_seq'::regclass);


--
-- Name: payment_transactions id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_transactions ALTER COLUMN id SET DEFAULT nextval('public.payment_transactions_id_seq'::regclass);


--
-- Name: prescription_items id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.prescription_items ALTER COLUMN id SET DEFAULT nextval('public.prescription_items_id_seq'::regclass);


--
-- Name: prescriptions id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.prescriptions ALTER COLUMN id SET DEFAULT nextval('public.prescriptions_id_seq'::regclass);


--
-- Name: queue_display_devices id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.queue_display_devices ALTER COLUMN id SET DEFAULT nextval('public.queue_display_devices_id_seq'::regclass);


--
-- Name: queue_entries id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.queue_entries ALTER COLUMN id SET DEFAULT nextval('public.queue_entries_id_seq'::regclass);


--
-- Name: rx_templates id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.rx_templates ALTER COLUMN id SET DEFAULT nextval('public.rx_templates_id_seq'::regclass);


--
-- Name: shop_cart id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_cart ALTER COLUMN id SET DEFAULT nextval('public.shop_cart_id_seq'::regclass);


--
-- Name: shop_order_items id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_order_items ALTER COLUMN id SET DEFAULT nextval('public.shop_order_items_id_seq'::regclass);


--
-- Name: shop_orders id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_orders ALTER COLUMN id SET DEFAULT nextval('public.shop_orders_id_seq'::regclass);


--
-- Name: shop_products id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_products ALTER COLUMN id SET DEFAULT nextval('public.shop_products_id_seq'::regclass);


--
-- Name: shop_wishlist id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_wishlist ALTER COLUMN id SET DEFAULT nextval('public.shop_wishlist_id_seq'::regclass);


--
-- Name: sliders id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.sliders ALTER COLUMN id SET DEFAULT nextval('public.sliders_id_seq'::regclass);


--
-- Name: sms_logs id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.sms_logs ALTER COLUMN id SET DEFAULT nextval('public.sms_logs_id_seq'::regclass);


--
-- Name: specialties id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.specialties ALTER COLUMN id SET DEFAULT nextval('public.specialties_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: tool_categories id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_categories ALTER COLUMN id SET DEFAULT nextval('public.tool_categories_id_seq'::regclass);


--
-- Name: tool_favorites id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_favorites ALTER COLUMN id SET DEFAULT nextval('public.tool_favorites_id_seq'::regclass);


--
-- Name: tool_usage id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_usage ALTER COLUMN id SET DEFAULT nextval('public.tool_usage_id_seq'::regclass);


--
-- Name: tools id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tools ALTER COLUMN id SET DEFAULT nextval('public.tools_id_seq'::regclass);


--
-- Name: user_addresses id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.user_addresses ALTER COLUMN id SET DEFAULT nextval('public.user_addresses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video_promotions id; Type: DEFAULT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.video_promotions ALTER COLUMN id SET DEFAULT nextval('public.video_promotions_id_seq'::regclass);


--
-- Data for Name: admin_otp_codes; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.admin_otp_codes (id, user_id, code, method, expires_at, used, created_at) FROM stdin;
\.


--
-- Data for Name: adsense_slots; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.adsense_slots (id, "position", code, enabled, updated_at) FROM stdin;
1	homepage_hero		f	2026-07-31 11:50:24.72334+00
2	homepage_middle		f	2026-07-31 11:50:24.72334+00
3	homepage_bottom		f	2026-07-31 11:50:24.72334+00
4	doctor_listing		f	2026-07-31 11:50:24.72334+00
5	doctor_detail		f	2026-07-31 11:50:24.72334+00
6	blog_detail		f	2026-07-31 11:50:24.72334+00
7	sidebar		f	2026-07-31 11:50:24.72334+00
\.


--
-- Data for Name: advertisements; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.advertisements (id, title, image_url, link_url, location, custom_width, custom_height, desktop_width, desktop_height, mobile_width, mobile_height, target_countries, target_divisions, priority, start_date, end_date, is_active, impressions, clicks, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ambulance_drivers; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.ambulance_drivers (id, user_id, name, phone, email, profile_photo, date_of_birth, address, nid_number, nid_photo, nid_back_photo, selfie_photo, licence_number, licence_photo, licence_expiry, division, district, upazila, service_radius, approval_status, approval_note, approved_by, approved_at, online_status, is_active, total_trips, total_earnings, avg_rating, rating_count, plan_name, plan_status, plan_start_date, plan_end_date, auto_renew, wallet_balance, verification_status, gps_enabled, last_active_at, commission_rate, created_at, updated_at) FROM stdin;
1	7	Test Driver	+8801900000001	driver@qrx.test	\N	\N	\N	\N	\N	\N	\N	LIC-12345	\N	\N	\N	\N	\N	20	approved	\N	4	2026-07-31 11:54:34.053+00	busy	t	0	0	\N	0	\N	\N	\N	\N	f	0	unverified	t	2026-07-31 11:54:46.259+00	\N	2026-07-31 11:53:52.483719+00	2026-07-31 11:54:56.209+00
2	10	RAJU	+8801722613281	RAJU@GMAIL.COM		2025-09-09	Rangpur	123456789				123456			Rangpur	RANGPUR	SADAR	20	approved	\N	4	2026-08-07 18:24:48.366+00	online	t	0	0	\N	0	\N	\N	\N	\N	f	0	unverified	t	2026-08-07 18:26:17.986+00	\N	2026-08-07 18:24:05.618255+00	2026-08-07 18:26:17.986+00
\.


--
-- Data for Name: ambulance_ratings; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.ambulance_ratings (id, request_id, user_id, driver_id, rating, review, created_at) FROM stdin;
\.


--
-- Data for Name: ambulance_requests; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.ambulance_requests (id, user_id, driver_id, vehicle_id, status, vehicle_type, is_sos, pickup_lat, pickup_lng, pickup_address, drop_lat, drop_lng, drop_address, patient_name, patient_condition, notes, estimated_fare, actual_fare, distance_km, currency, cancellation_reason, cancelled_by, requested_at, accepted_at, arrived_at, completed_at, created_at, updated_at) FROM stdin;
1	6	1	\N	accepted	basic	f	23.8103	90.4125	Dhaka Medical	\N	\N	\N	Test Patient	\N	\N	500	\N	\N	BDT	\N	\N	2026-07-31 11:54:46.317395+00	2026-07-31 11:54:56.204+00	\N	\N	2026-07-31 11:54:46.317395+00	2026-07-31 11:54:56.204+00
\.


--
-- Data for Name: ambulance_settings; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.ambulance_settings (id, commission_enabled, commission_rate, subscription_enabled, featured_listing_enabled, driver_verification_fee_enabled, driver_verification_fee_amount, base_fare_bdt, per_km_rate_bdt, offline_timeout_minutes, request_timeout_seconds, updated_at) FROM stdin;
1	t	10	f	f	f	0	500	20	15	0	2026-07-31 11:54:46.311583+00
\.


--
-- Data for Name: ambulance_vehicles; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.ambulance_vehicles (id, driver_id, vehicle_type, registration_number, vehicle_photo, make, model, year, seating_capacity, is_active, created_at, updated_at) FROM stdin;
1	1	Basic	DH-1234	\N	\N	\N	\N	\N	t	2026-07-31 11:53:52.497186+00	2026-07-31 11:53:52.497186+00
2	2	ac	DH123456		\N	1452	\N	6	t	2026-08-07 18:24:05.620373+00	2026-08-07 18:24:05.620373+00
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.app_settings (id, prescription_qr_enabled, notice_text, notice_enabled, hero_image_url, hero_overlay_color, hero_overlay_opacity, theme_colors_enabled, theme_primary_light, theme_primary_dark, theme_bg_light, theme_bg_dark, doctor_card_light, doctor_card_dark, smtp_host, smtp_port, smtp_user, smtp_password, smtp_from_email, smtp_from_name, smtp_enabled, sms_provider, sms_api_key, sms_sender_id, sms_enabled, shop_enabled, monthly_subscription_fee, auto_approve_on_payment, manual_payment_enabled, admin_2fa_enabled, admin_2fa_method, admin_2fa_otp_expiry_minutes, admin_2fa_mobile_api_url, admin_2fa_mobile_api_key, site_logo_url, site_logo_width, site_logo_height, favicon_url, footer_logo_url, footer_site_name, footer_tagline, footer_copyright_text, footer_about, donation_enabled, donation_amount, donation_amount_usd, donation_message, bdt_tier1_max_years, bdt_tier1_fee, bdt_tier2_max_years, bdt_tier2_fee, bdt_tier3_fee, usd_tier1_max_years, usd_tier1_fee, usd_tier2_max_years, usd_tier2_fee, usd_tier3_fee, monthly_subscription_fee_usd, doctor_template_management_enabled, updated_at) FROM stdin;
1	t	\N	f	\N	#0f172a	40	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	f	f	500	f	t	f	email	10	\N	\N	\N	32	32	\N	\N	\N	\N	\N	\N	f	100	1	\N	5	0	10	500	1000	5	0	10	5	10	5	t	2026-08-07 18:33:56.719+00
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.appointments (id, doctor_id, patient_name, patient_phone, patient_email, patient_age, patient_gender, complaint, bp, pulse, temp, weight, height, hb, sugar, spo2, medical_history, notes, lab_report_url, prescription_upload_url, booking_source, appointment_date, appointment_time, serial_no, status, tracking_token, confirmation_email_sent, confirmation_sms_status, donation_paid, donation_amount, donation_currency, donation_paid_at, created_at, updated_at) FROM stdin;
1	2	Test Patient	+8801800000001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	online	2026-08-05	10:00	1	pending	043d7339a97e7d35	f	pending	f	\N	\N	\N	2026-07-31 11:51:24.883922+00	2026-07-31 11:51:24.883922+00
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.audit_logs (id, actor_user_id, actor_role, actor_name, action, entity_type, entity_id, details, created_at) FROM stdin;
1	4	admin	Admin	approve	doctor	1	Dr. Ahmed Rahman	2026-07-31 11:51:20.804525+00
2	5	doctor	Dr. Amir Hossain	create	prescription	1	Test Patient (final)	2026-07-31 11:51:46.290051+00
3	5	doctor	Dr. Amir Hossain	update	prescription	1	Test Patient (final)	2026-07-31 11:52:20.496558+00
4	5	doctor	Dr. Amir Hossain	create	prescription	2	Test Patient 2 (final)	2026-07-31 11:55:44.358449+00
5	4	admin	Admin	approve	doctor	3	Dr.Apple Roy 	2026-08-07 18:14:50.417782+00
6	4	admin	Admin	feature	doctor	3	Dr.Apple Roy 	2026-08-07 18:15:01.304291+00
7	4	admin	Admin	feature	doctor	2	Dr. Amir Hossain	2026-08-07 18:15:28.47334+00
8	4	admin	Admin	feature	doctor	1	Dr. Ahmed Rahman	2026-08-07 18:15:31.641007+00
9	4	admin	Admin	mark_senior	doctor	1	Dr. Ahmed Rahman	2026-08-07 18:15:32.501079+00
10	4	admin	Admin	mark_senior	doctor	2	Dr. Amir Hossain	2026-08-07 18:15:33.172578+00
11	4	admin	Admin	mark_senior	doctor	3	Dr.Apple Roy 	2026-08-07 18:15:33.920276+00
12	4	admin	\N	ambulance_driver_approved	ambulance_drivers	2	\N	2026-08-07 18:24:48.370899+00
13	4	admin	Admin	update	menu_item	3	\N	2026-08-07 18:34:25.934374+00
14	4	admin	Admin	update	menu_item	3	\N	2026-08-07 18:34:28.514627+00
15	4	admin	Admin	update	menu_item	3	\N	2026-08-07 18:34:29.87415+00
16	4	admin	Admin	update	menu_item	5	\N	2026-08-07 18:34:34.214483+00
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.banners (id, title, image_url, link_url, description, "position", size, custom_width, custom_height, desktop_width, desktop_height, mobile_width, mobile_height, target_countries, target_divisions, display_order, priority, start_date, end_date, is_active, impressions, clicks, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.blog_posts (id, title, slug, excerpt, content, cover_image_url, author_name, category, tags, seo_title, meta_description, focus_keyword, canonical_url, status, published_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: blood_donor_conversations; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.blood_donor_conversations (id, request_id, requester_id, donor_id, created_at) FROM stdin;
1	1	1	6	2026-07-31 11:52:42.16629+00
\.


--
-- Data for Name: blood_donor_messages; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.blood_donor_messages (id, conversation_id, sender_id, message, is_read, created_at) FROM stdin;
1	1	6	I can donate, please contact me at +8801700000001	f	2026-07-31 11:53:58.33568+00
2	1	6	hello	f	2026-08-07 18:09:33.076076+00
\.


--
-- Data for Name: blood_donor_requests; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.blood_donor_requests (id, requester_id, donor_id, blood_group, message, status, created_at, updated_at) FROM stdin;
1	1	6	A+	Urgently need blood for surgery	accepted	2026-07-31 11:52:42.134733+00	2026-07-31 11:52:42.159+00
\.


--
-- Data for Name: calculators; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.calculators (id, title, slug, category, short_description, content, featured_image_url, seo_title, meta_description, status, schema_enabled, fields_json, formulas_json, results_json, faqs_json, placements_json, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: chat_conversations; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.chat_conversations (id, doctor1_id, doctor2_id, last_message_at, created_at) FROM stdin;
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.chat_messages (id, conversation_id, sender_doctor_id, message, attachment_url, attachment_type, attachment_name, attachment_size, is_read, is_deleted, created_at) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.cities (id, name, country_id) FROM stdin;
1	Dhaka	1
2	Chittagong	1
3	Sylhet	1
4	Rajshahi	1
5	Khulna	1
6	Barisal	1
7	Rangpur	1
8	Mymensingh	1
9	Comilla	1
10	Narayanganj	1
11	Gazipur	1
12	Delhi	2
13	Mumbai	2
14	Kolkata	2
15	Chennai	2
16	Bangalore	2
17	Hyderabad	2
18	Ahmedabad	2
19	Pune	2
20	Jaipur	2
21	Lucknow	2
22	Surat	2
23	New York	3
24	Los Angeles	3
25	Chicago	3
26	Houston	3
27	Phoenix	3
28	Philadelphia	3
29	San Antonio	3
30	San Diego	3
31	Dallas	3
32	San Jose	3
33	London	4
34	Birmingham	4
35	Manchester	4
36	Leeds	4
37	Glasgow	4
38	Sheffield	4
39	Bradford	4
40	Liverpool	4
41	Edinburgh	4
42	Bristol	4
43	Toronto	5
44	Montreal	5
45	Vancouver	5
46	Calgary	5
47	Edmonton	5
48	Ottawa	5
49	Winnipeg	5
50	Quebec City	5
51	Hamilton	5
52	Sydney	6
53	Melbourne	6
54	Brisbane	6
55	Perth	6
56	Adelaide	6
57	Gold Coast	6
58	Canberra	6
59	Hobart	6
60	Berlin	7
61	Hamburg	7
62	Munich	7
63	Cologne	7
64	Frankfurt	7
65	Stuttgart	7
66	Düsseldorf	7
67	Leipzig	7
68	Paris	8
69	Marseille	8
70	Lyon	8
71	Toulouse	8
72	Nice	8
73	Nantes	8
74	Strasbourg	8
75	Bordeaux	8
76	Tokyo	10
77	Osaka	10
78	Yokohama	10
79	Nagoya	10
80	Sapporo	10
81	Kobe	10
82	Kyoto	10
83	Singapore	11
84	Kuala Lumpur	12
85	George Town	12
86	Johor Bahru	12
87	Ipoh	12
88	Kota Kinabalu	12
89	Kuching	12
90	Dubai	13
91	Abu Dhabi	13
92	Sharjah	13
93	Ajman	13
94	Ras Al Khaimah	13
95	Fujairah	13
96	Riyadh	14
97	Jeddah	14
98	Mecca	14
99	Medina	14
100	Dammam	14
101	Khobar	14
102	Tabuk	14
103	Doha	15
104	Al Rayyan	15
105	Al Wakrah	15
106	Al Khor	15
107	Kuwait City	16
108	Hawalli	16
109	Salmiya	16
110	Farwaniya	16
111	Muscat	17
112	Salalah	17
113	Sohar	17
114	Nizwa	17
115	Auckland	18
116	Wellington	18
117	Christchurch	18
118	Hamilton	18
119	Tauranga	18
120	Karachi	19
121	Lahore	19
122	Islamabad	19
123	Rawalpindi	19
124	Faisalabad	19
125	Peshawar	19
126	Colombo	20
127	Kandy	20
128	Galle	20
129	Jaffna	20
130	Negombo	20
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.countries (id, name, code, dial_code, flag) FROM stdin;
1	Bangladesh	BD	+880	🇧🇩
2	India	IN	+91	🇮🇳
3	United States	US	+1	🇺🇸
4	United Kingdom	GB	+44	🇬🇧
5	Canada	CA	+1	🇨🇦
6	Australia	AU	+61	🇦🇺
7	Germany	DE	+49	🇩🇪
8	France	FR	+33	🇫🇷
9	Italy	IT	+39	🇮🇹
10	Japan	JP	+81	🇯🇵
11	Singapore	SG	+65	🇸🇬
12	Malaysia	MY	+60	🇲🇾
13	UAE	AE	+971	🇦🇪
14	Saudi Arabia	SA	+966	🇸🇦
15	Qatar	QA	+974	🇶🇦
16	Kuwait	KW	+965	🇰🇼
17	Oman	OM	+968	🇴🇲
18	New Zealand	NZ	+64	🇳🇿
19	Pakistan	PK	+92	🇵🇰
20	Sri Lanka	LK	+94	🇱🇰
21	Nepal	NP	+977	🇳🇵
22	Maldives	MV	+960	🇲🇻
23	Myanmar	MM	+95	🇲🇲
24	Thailand	TH	+66	🇹🇭
25	Indonesia	ID	+62	🇮🇩
26	Philippines	PH	+63	🇵🇭
27	Vietnam	VN	+84	🇻🇳
28	China	CN	+86	🇨🇳
29	South Korea	KR	+82	🇰🇷
30	Hong Kong	HK	+852	🇭🇰
31	Taiwan	TW	+886	🇹🇼
32	Bahrain	BH	+973	🇧🇭
33	Jordan	JO	+962	🇯🇴
34	Turkey	TR	+90	🇹🇷
35	Egypt	EG	+20	🇪🇬
36	Nigeria	NG	+234	🇳🇬
37	South Africa	ZA	+27	🇿🇦
38	Kenya	KE	+254	🇰🇪
39	Ethiopia	ET	+251	🇪🇹
40	Ghana	GH	+233	🇬🇭
41	Spain	ES	+34	🇪🇸
42	Netherlands	NL	+31	🇳🇱
43	Sweden	SE	+46	🇸🇪
44	Norway	NO	+47	🇳🇴
45	Denmark	DK	+45	🇩🇰
46	Switzerland	CH	+41	🇨🇭
47	Ireland	IE	+353	🇮🇪
48	Portugal	PT	+351	🇵🇹
49	Greece	GR	+30	🇬🇷
50	Poland	PL	+48	🇵🇱
51	Russia	RU	+7	🇷🇺
52	Brazil	BR	+55	🇧🇷
53	Argentina	AR	+54	🇦🇷
54	Mexico	MX	+52	🇲🇽
55	Colombia	CO	+57	🇨🇴
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.departments (id, name, icon, description) FROM stdin;
1	General Medicine(মেডিসিন)	💊	Primary care and internal medicine
2	Surgery(সার্জারি)	✂️	General and specialist surgical procedures
5	Gynecology & Obstetrics (প্রসূতি ও স্ত্রীরোগ)	🤰	Women's reproductive health and pregnancy
3	Cardiology(হৃদরোগ)	❤️	Heart and cardiovascular system
26	Neurosurgery(নিউরোসার্জারি)	⚕️	\N
14	Gastroenterology(গ্যাস্ট্রোএন্টারোলজি)	🍤	Digestive system and gastrointestinal tract
25	Hepatology(লিভার )	🥩	Liver, gallbladder and pancreas
13	Endocrinology(হরমোন)	🧬	Hormonal and metabolic disorders
8	Dermatology(চর্ম ও যৌন)	🧖‍♀️	Skin, hair and nail conditions
11	Psychiatry(মনোরোগবিদ্যা)	👩🏻‍⚕️	Mental health and behavioral disorders
10	ENT(নাক কান গলা)	👂	Ear, nose and throat diseases
9	Ophthalmology(চক্ষু)	👁️	Eye care and vision disorders
17	Oncology(ক্যান্সার)	🎗️	Cancer diagnosis and treatment
21	Anesthesiology(অ্যানেসথেসিওলজি)	💉	Anesthesia and pain management
20	Radiology(রেডিওলজি)	🔬	Medical imaging and diagnostics
19	Dentistry(ডেন্টাল)	🦷	Oral health, teeth and gums
23	Hematology(রক্ত)	🩸	Blood disorders and diseases
6	Pediatrics(শিশু)	👶	Medical care for infants, children and adolescents
24	Physiotherapy(ফিজিওথেরাপি)	🏃	Physical rehabilitation and therapy
22	Emergency Medicine(জরুরি চিকিৎসা)	🚑	Acute and emergency care
4	Orthopedics(হাড়,জোড়)	🦴	Bones, joints, and musculoskeletal system
7	Neurology(স্নায়ুরোগ বিশেষজ্ঞ)	🧠	Brain, spinal cord and nervous system
18	Rheumatology(বাতরোগ বিশেষজ্ঞ)	🦵🏾	Arthritis and autoimmune diseases
16	Nephrology(কিডনি রোগ বিশেষজ্ঞ)	🩺	Kidney diseases and renal care
12	Urology(কিডনি ও মূত্রথলি)	💧	Urinary tract and male reproductive system
27	Homeopathy	🚻	\N
15	Pulmonology(বক্ষব্যাধি)	🫁	Lungs and respiratory system
\.


--
-- Data for Name: doctor_availability; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctor_availability (id, doctor_id, day_of_week, start_time, end_time, break_start, break_end, max_appointments, is_available) FROM stdin;
\.


--
-- Data for Name: doctor_connections; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctor_connections (id, requester_doctor_id, receiver_doctor_id, status, created_at, updated_at) FROM stdin;
1	2	1	accepted	2026-07-31 11:52:27.074545+00	2026-07-31 11:52:51.52+00
\.


--
-- Data for Name: doctor_consultations; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctor_consultations (id, requester_doctor_id, consultant_doctor_id, patient_info, case_notes, attachment_url, attachment_type, attachment_name, attachment_size, response_notes, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctor_notices; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctor_notices (id, doctor_id, title, message, type, from_date, to_date, from_time, to_time, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctor_rx_settings; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctor_rx_settings (id, doctor_id, header_name, header_degree, header_designation, header_bmdc, hospital_name, header_address, header_phone, header_email, signature_text, signature_image, page_size, margin_top, margin_right, margin_bottom, margin_left, header_height, footer_height, show_header, show_qr, show_signature, show_footer, footer_text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.doctors (id, user_id, name, phone, email, photo_url, degree, department_id, specialty_id, location_id, country_id, city_id, timezone, experience, chamber_address, visiting_time, chamber_address_2, visiting_time_2, consultation_fee, bmdc_number, bmdc_file, bmdc_validity_years, subscription_fee, currency, approval_status, is_featured, is_senior, is_verified, online_consultation_available, emergency_available, online_status, break_until, last_active_at, about, services, education, created_at, updated_at) FROM stdin;
3	8	Dr.Apple Roy 	01722613281	appleroy@gmail.com	\N	MBBS	4	\N	\N	1	7	\N	\N	Rangpur	6.30 PM - 9.30 PM	\N	\N	1000	A12345	\N	8	500	BDT	approved	t	t	t	f	f	offline	\N	2026-08-07 18:18:24.208+00		\N		2026-08-07 18:13:38.713106+00	2026-08-07 18:18:24.208+00
1	3	Dr. Ahmed Rahman	+8801711111111	drahmed@qrx.test	\N	MBBS, MD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	BMDC-12345	\N	2	0	USD	approved	t	t	t	f	f	offline	\N	\N	Test cardiologist for end-to-end testing	\N	\N	2026-07-31 11:49:43.049239+00	2026-08-07 18:15:32.499+00
2	5	Dr. Amir Hossain	01700000000	amir@example.com	/objects/uploads/general/a498c48c-38b5-4473-b670-377322284f64	MBBS, FCPS	\N	\N	\N	\N	\N	\N	\N	QRX Medical Center, Dhaka	Sat-Thu: 10am-2pm			500	A-12345	\N	3	0	BDT	approved	t	t	t	f	f	offline	\N	2026-08-07 18:07:24.038+00		\N		2026-07-31 11:50:26.399213+00	2026-08-07 18:15:33.171+00
\.


--
-- Data for Name: driver_locations; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.driver_locations (id, driver_id, lat, lng, heading, speed, updated_at) FROM stdin;
1	1	23.8103	90.4125	\N	\N	2026-07-31 11:54:34.118237+00
\.


--
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.email_logs (id, recipient_email, subject, body, status, error_message, created_at) FROM stdin;
1	drahmed@qrx.test	QRX — Registration Received	Dear Dr. Ahmed Rahman,\n\nThank you for registering on QRX. Your application is now under review.\n\nOnce an admin approves your account you will receive another email and you can log in to complete your subscription payment (if applicable).\n\nIf you have any questions, please contact our support team.\n\nBest regards,\nQRX Team	logged	\N	2026-07-31 11:49:43.07172+00
2	drahmed@qrx.test	QRX — Your Registration Has Been Approved! 🎉	Dear Dr. Ahmed Rahman,\n\nGreat news! Your doctor registration on QRX has been approved.\n\nYou can now log in to your dashboard using your registered email and password.\nYour account has free access based on your BMDC validity period.\n\nWelcome to the QRX platform!\n\nBest regards,\nQRX Team	logged	\N	2026-07-31 11:51:20.813166+00
3	appleroy@gmail.com	QRX — Registration Received	Dear Dr.Apple Roy ,\n\nThank you for registering on QRX. Your application is now under review.\n\nOnce an admin approves your account you will receive another email and you can log in to complete your subscription payment (if applicable).\n\nIf you have any questions, please contact our support team.\n\nBest regards,\nQRX Team	logged	\N	2026-08-07 18:13:38.718508+00
4	admin@doctorx.com.bd	QRX — New Doctor Registration: Dr.Apple Roy 	A new doctor has registered and is awaiting your approval.\n\nName: Dr.Apple Roy \nEmail: appleroy@gmail.com\nBMDC No: A12345\nBMDC Validity: 8 years\nDegree: MBBS\n\nPlease log in to the admin panel to review and approve or reject this registration.\n\nQRX Admin System	logged	\N	2026-08-07 18:13:38.727503+00
5	appleroy@gmail.com	QRX — Your Registration Has Been Approved! 🎉	Dear Dr.Apple Roy ,\n\nGreat news! Your doctor registration on QRX has been approved.\n\nYou can now log in to your dashboard using your registered email and password.\nYour monthly subscription fee is ৳500/month. Please log in and complete your payment from your profile page to activate full access.\n\nWelcome to the QRX platform!\n\nBest regards,\nQRX Team	logged	\N	2026-08-07 18:14:50.421171+00
\.


--
-- Data for Name: emergency_blood_requests; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.emergency_blood_requests (id, user_id, blood_group, quantity, hospital, city, contact_number, notes, status, created_at) FROM stdin;
\.


--
-- Data for Name: emergency_contact_reports; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.emergency_contact_reports (id, contact_id, reason, created_at) FROM stdin;
\.


--
-- Data for Name: emergency_contacts; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.emergency_contacts (id, category, name, mobile_number, driver_name, vehicle_number, country, division, district, upazila, area, notes, availability_status, is_verified, is_priority, is_active, report_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.locations (id, name, district) FROM stdin;
\.


--
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.medicines (id, brand_name, generic_name, strength, dosage_form, manufacturer) FROM stdin;
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.menu_items (id, label, title_bn, url, location, footer_group, menu_type, visibility, parent_id, display_order, open_in_new_tab, is_no_follow, is_active, created_at, updated_at) FROM stdin;
1	Home	হোম	/	header	\N	internal	public	\N	10	f	f	t	2026-07-31 11:50:24.857885+00	2026-07-31 11:50:24.857885+00
2	Find a Doctor	ডাক্তার খুঁজুন	/doctors	header	\N	internal	public	\N	20	f	f	t	2026-07-31 11:50:24.861604+00	2026-07-31 11:50:24.861604+00
4	Track Queue	কিউ ট্র্যাক	/track	header	\N	internal	public	\N	40	f	f	t	2026-07-31 11:50:24.868381+00	2026-07-31 11:50:24.868381+00
6	Blood Donors	রক্তদাতা	/blood-donors	header	\N	internal	public	\N	60	f	f	t	2026-07-31 11:50:24.876101+00	2026-07-31 11:50:24.876101+00
7	Ambulance	অ্যাম্বুলেন্স	/ambulance	header	\N	internal	public	\N	70	f	f	t	2026-07-31 11:50:24.879836+00	2026-07-31 11:50:24.879836+00
8	Emergency	জরুরি	/emergency	header	\N	internal	public	\N	80	f	f	t	2026-07-31 11:50:24.885421+00	2026-07-31 11:50:24.885421+00
9	Blog	ব্লগ	/blog	header	\N	blog	public	\N	90	f	f	t	2026-07-31 11:50:24.890772+00	2026-07-31 11:50:24.890772+00
10	For Doctors	ডাক্তারদের জন্য	/doctor-register	header	\N	internal	public	\N	100	f	f	t	2026-07-31 11:50:24.894351+00	2026-07-31 11:50:24.894351+00
11	Find a Doctor	ডাক্তার খুঁজুন	/doctors	footer	quick-links	internal	public	\N	10	f	f	t	2026-07-31 11:50:24.8977+00	2026-07-31 11:50:24.8977+00
12	Track Queue	কিউ ট্র্যাক	/track	footer	quick-links	internal	public	\N	20	f	f	t	2026-07-31 11:50:24.901584+00	2026-07-31 11:50:24.901584+00
13	Track Order	অর্ডার ট্র্যাক	/track-order	footer	quick-links	internal	public	\N	30	f	f	t	2026-07-31 11:50:24.905357+00	2026-07-31 11:50:24.905357+00
14	Shop	শপ	/shop	footer	quick-links	internal	public	\N	40	f	f	t	2026-07-31 11:50:24.908755+00	2026-07-31 11:50:24.908755+00
15	For Doctors	ডাক্তারদের জন্য	/doctor-register	footer	services	internal	public	\N	10	f	f	t	2026-07-31 11:50:24.912716+00	2026-07-31 11:50:24.912716+00
16	Ambulance Driver	অ্যাম্বুলেন্স ড্রাইভার	/driver	footer	services	internal	public	\N	20	f	f	t	2026-07-31 11:50:24.916317+00	2026-07-31 11:50:24.916317+00
17	Blood Donors	রক্তদাতা	/blood-donors	footer	services	internal	public	\N	30	f	f	t	2026-07-31 11:50:24.920561+00	2026-07-31 11:50:24.920561+00
18	Ambulance	অ্যাম্বুলেন্স	/ambulance	footer	services	internal	public	\N	40	f	f	t	2026-07-31 11:50:24.924487+00	2026-07-31 11:50:24.924487+00
19	Blog	ব্লগ	/blog	footer	resources	blog	public	\N	10	f	f	t	2026-07-31 11:50:24.928844+00	2026-07-31 11:50:24.928844+00
20	Emergency	জরুরি	/emergency	footer	resources	internal	public	\N	20	f	f	t	2026-07-31 11:50:24.932637+00	2026-07-31 11:50:24.932637+00
3	Shop	শপ	/shop	header	\N	internal	public	\N	30	f	f	f	2026-07-31 11:50:24.864957+00	2026-08-07 18:34:29.872+00
5	Track Order	অর্ডার ট্র্যাক	/track-order	header	\N	internal	public	\N	50	f	f	f	2026-07-31 11:50:24.8722+00	2026-08-07 18:34:34.213+00
\.


--
-- Data for Name: migration_batches; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.migration_batches (id, entity_type, file_name, format, total_rows, imported_rows, skipped_rows, status, created_by_user_id, created_at) FROM stdin;
\.


--
-- Data for Name: migration_records; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.migration_records (id, batch_id, entity_type, entity_id, created_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.notifications (id, user_id, type, title, message, is_read, related_id, created_at) FROM stdin;
1	3	registration	Registration Submitted	Your doctor registration is under review. You'll be notified once approved.	f	\N	2026-07-31 11:49:43.08116+00
2	3	approved	Registration Approved 🎉	Your account is approved! You have free access. Log in to start using your dashboard.	f	1	2026-07-31 11:51:20.822787+00
3	5	appointment	New Appointment Booked	Test Patient booked an appointment for 2026-08-05. Serial #1.	f	1	2026-07-31 11:51:24.900127+00
4	3	friend_request	New Friend Request	Dr. Dr. Amir Hossain sent you a friend request	f	1	2026-07-31 11:52:27.080505+00
6	1	blood_request_accepted	🩸 Blood Request Accepted!	Test Patient Donor accepted your blood request. You can now chat to arrange the donation.	f	1	2026-07-31 11:52:42.170688+00
8	4	ambulance_driver_pending	New Ambulance Driver Registration	Test Driver registered as an ambulance driver and awaits approval.	f	1	2026-07-31 11:53:52.506572+00
9	1	blood_chat_message	💬 New message from Test Patient Donor	I can donate, please contact me at +8801700000001	f	1	2026-07-31 11:53:58.385342+00
5	6	blood_request	🩸 Blood Request Received	Test Patient needs A+ blood. Open Blood Requests to respond.	t	1	2026-07-31 11:52:42.141467+00
10	7	ambulance_driver_approved	Driver Account Approved	Your ambulance driver account has been approved. You can now go online and accept rides.	f	1	2026-07-31 11:54:34.06075+00
11	4	ambulance_request	New Ambulance Request	User 6 requested a basic ambulance.	f	1	2026-07-31 11:54:46.323658+00
7	5	friend_accepted	Friend Request Accepted	Dr. Dr. Ahmed Rahman accepted your friend request	t	1	2026-07-31 11:52:51.55288+00
13	1	blood_chat_message	💬 New message from Test Patient Donor	hello	f	1	2026-08-07 18:09:33.079257+00
12	6	ambulance_accepted	Ambulance On The Way	Your ambulance request has been accepted. Driver: Test Driver, Phone: +8801900000001	t	1	2026-07-31 11:54:56.214411+00
14	8	registration	Registration Submitted	Your doctor registration is under review. You'll be notified once approved.	f	\N	2026-08-07 18:13:38.723862+00
15	4	new_doctor	New Doctor Registration	Dr.Apple Roy  has registered and is awaiting your approval.	f	3	2026-08-07 18:13:38.727956+00
16	8	approved	Registration Approved 🎉	Your account is approved! Please log in and complete your subscription payment (৳500/mo) to activate full access.	f	3	2026-08-07 18:14:50.426147+00
17	4	ambulance_driver_pending	New Ambulance Driver Registration	RAJU registered as an ambulance driver and awaits approval.	f	2	2026-08-07 18:24:05.622429+00
18	10	ambulance_driver_approved	Driver Account Approved	Your ambulance driver account has been approved. You can now go online and accept rides.	f	2	2026-08-07 18:24:48.369566+00
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.password_reset_tokens (id, user_id, token, expires_at, used, created_at) FROM stdin;
\.


--
-- Data for Name: patient_referrals; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.patient_referrals (id, referrer_doctor_id, receiver_doctor_id, patient_name, patient_phone, patient_age, patient_gender, referral_reason, notes, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: patient_reviews; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.patient_reviews (id, doctor_id, appointment_id, patient_name, patient_phone, rating, review_text, is_approved, created_at) FROM stdin;
\.


--
-- Data for Name: payment_gateways; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.payment_gateways (id, gateway, enabled, api_key, secret_key, merchant_id, mode, success_url, failed_url, callback_url, qr_image_url, merchant_name, payment_instructions, success_message, failure_message, updated_at) FROM stdin;
1	sslcommerz	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
2	shurjopay	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
3	aamarpay	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
4	bkash	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
5	nagad	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
6	rocket	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
7	bangla_qr	f	\N	\N	\N	sandbox	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-31 11:50:24.734833+00
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.payment_transactions (id, gateway, tran_id, purpose, subscription_id, doctor_id, order_id, months, amount, currency, status, gateway_val_id, gateway_response, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: prescription_items; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.prescription_items (id, prescription_id, medicine_id, medicine_name, generic_name, strength, dosage_form, dose, duration, meal_timing, instruction) FROM stdin;
1	2	\N	Metformin	\N	500mg	\N	1 tablet	30 days	after_meal	With water
2	2	\N	Glipizide	\N	5mg	\N	1 tablet	30 days	before_meal	\N
\.


--
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.prescriptions (id, reference_no, status, doctor_id, appointment_id, patient_name, patient_phone, patient_age, patient_gender, patient_weight, patient_height, chief_complaint, vitals, examination, diagnosis, investigations, advice, follow_up_date, notes, created_at, updated_at) FROM stdin;
1	RX-2026-000001	final	2	1	Test Patient	\N	35	male	\N	\N	Chest pain	\N	\N	Hypertension - Updated	\N	Low salt diet, regular exercise, walk 30min daily	2026-09-01	\N	2026-07-31 11:51:46.276051+00	2026-07-31 11:52:20.486+00
2	RX-2026-000002	final	2	\N	Test Patient 2	\N	40	female	\N	\N	High blood sugar	\N	\N	Diabetes Type 2	\N	Diet control	2026-09-15	\N	2026-07-31 11:55:44.334835+00	2026-07-31 11:55:44.341+00
\.


--
-- Data for Name: queue_display_devices; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.queue_display_devices (id, doctor_id, name, display_type, width, height, font_size, layout_size, fullscreen, orientation, is_active, show_patient_name, show_doctor_name, voice_enabled, voice_language, theme, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: queue_entries; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.queue_entries (id, doctor_id, appointment_id, patient_name, patient_phone, serial_no, status, queue_date, created_at, updated_at) FROM stdin;
1	2	1	Test Patient	+8801800000001	1	seen	2026-07-31	2026-07-31 11:51:41.876167+00	2026-07-31 11:52:13.536+00
\.


--
-- Data for Name: rx_templates; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.rx_templates (id, doctor_id, type, title, content, department, is_favorite, is_hidden, is_builtin, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: shop_cart; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.shop_cart (id, user_id, product_id, quantity, created_at) FROM stdin;
\.


--
-- Data for Name: shop_order_items; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.shop_order_items (id, order_id, product_id, quantity, price_at_purchase) FROM stdin;
\.


--
-- Data for Name: shop_orders; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.shop_orders (id, user_id, status, payment_status, payment_method, total_amount, qr_transaction_id, qr_screenshot_url, shipping_name, shipping_phone, shipping_address, shipping_city, notes, created_at) FROM stdin;
\.


--
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.shop_products (id, name, description, price, original_price, category, image_url, stock_qty, is_active, is_featured, rating, review_count, tags, created_at) FROM stdin;
\.


--
-- Data for Name: shop_wishlist; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.shop_wishlist (id, user_id, product_id, created_at) FROM stdin;
\.


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.sliders (id, title, image_url, link_url, button_text, description, "position", is_active, start_date, end_date, priority, display_order, auto_play, slide_interval, show_arrows, show_dots, desktop_width, desktop_height, mobile_width, mobile_height, tablet_width, tablet_height, custom_width, custom_height, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sms_logs; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.sms_logs (id, phone, message, status, provider, error_message, created_at) FROM stdin;
1	+8801800000001	Appointment confirmed with Dr. Dr. Amir Hossain on 2026-08-05. Serial: #1. Track: https://a04d03c9-4c94-4f1e-aae9-e77ae1850f08-00-29tell89ixvv0.pike.replit.dev/track?phone=%2B8801800000001	logged	unset	\N	2026-07-31 11:51:24.893003+00
\.


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.specialties (id, name, department_id) FROM stdin;
1	General Medicine	1
2	Internal Medicine	1
3	Acute Medicine	1
4	Cardiology	1
5	Neurology	1
6	Nephrology	1
7	Gastroenterology	1
8	Hepatology	1
9	Respiratory Medicine	1
10	Endocrinology	1
11	Rheumatology	1
12	Haematology	1
13	Infectious Disease	1
14	Geriatric Medicine	1
15	Geriatric Medicine	1
16	Allergy & Immunology	1
17	Sleep Medicine	1
18	General Surgery	2
19	Gastrointestinal Surgery	2
20	Hepatobiliary Surgery	2
21	Colorectal Surgery	2
22	Breast Surgery	2
23	Surgical Oncology	2
24	Vascular Surgery	2
25	Transplant Surgery	2
26	Trauma Surgery	2
27	Laparoscopic Surgery	2
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.subscriptions (id, doctor_id, bmdc_validity_years, fee, months, monthly_fee, currency, payment_status, start_date, end_date, status, created_at, updated_at) FROM stdin;
1	1	2	0	\N	\N	USD	free	\N	\N	active	2026-07-31 11:49:43.062152+00	2026-07-31 11:51:20.799+00
2	3	8	500	1	\N	BDT	unpaid	\N	\N	active	2026-08-07 18:13:38.716216+00	2026-08-07 18:14:50.416+00
\.


--
-- Data for Name: tool_categories; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.tool_categories (id, name, slug, is_default, created_at) FROM stdin;
1	Calculator	calculator	t	2026-07-31 11:50:24.740683+00
2	Drug	drug	t	2026-07-31 11:50:24.740683+00
3	Clinical Score	clinical-score	t	2026-07-31 11:50:24.740683+00
4	Emergency	emergency	t	2026-07-31 11:50:24.740683+00
5	Reference	reference	t	2026-07-31 11:50:24.740683+00
6	Custom	custom	t	2026-07-31 11:50:24.740683+00
\.


--
-- Data for Name: tool_favorites; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.tool_favorites (id, doctor_id, tool_id, created_at) FROM stdin;
\.


--
-- Data for Name: tool_usage; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.tool_usage (id, doctor_id, tool_id, used_at) FROM stdin;
\.


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.tools (id, name, slug, type, category_id, department, short_description, featured_image_url, icon, status, version, html_code, css_code, js_code, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_addresses; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.user_addresses (id, user_id, label, recipient_name, phone, alt_phone, country, division, district, upazila, postal_code, full_address, is_default, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.users (id, email, password, name, role, doctor_id, phone, date_of_birth, gender, blood_group, address, country, division, district, area, profile_picture, emergency_contact, nationality, preferred_language, is_donor, donor_status, last_donation_date, permissions, created_at, updated_at) FROM stdin;
1	testpatient@qrx.test	$2b$12$FgdEnAd.rvF8wyOtj7sdxuC4fSwXp6diDOIi/Tj0G4S2RXuVRFwEa	Test Patient	patient	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:49:05.970897+00	2026-07-31 11:49:05.970897+00
2	testdoctor@qrx.test	$2b$12$ik2oFC8PAR1MIu7dDQOuGeGW9rCn0S/j8QKcyBoslZ4qBSSNrK2hi	Dr. Test Doctor	patient	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:49:07.290196+00	2026-07-31 11:49:07.290196+00
3	drahmed@qrx.test	$2b$12$wjEBzhD5LLpXSMJVkWC4GuY.mpT1yTM4nrQDcsS1aOhc8bYeOJM.2	Dr. Ahmed Rahman	doctor	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:49:43.039596+00	2026-07-31 11:49:43.054+00
5	amir@example.com	$2b$12$w1VTYMfaYTMu1UXdXISawew4/Kv4GjfPzoEc7NQbXELpY6NjsJvYK	Dr. Amir Hossain	doctor	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:50:26.389907+00	2026-07-31 11:50:26.404+00
7	driver@qrx.test	$2b$12$Tp3d4LUqxhAiY3uKTjD/ZOKA3G5np23DPFMyCOCSvbDSiXuXT4klK	Test Driver	driver	\N	+8801900000001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:53:52.468658+00	2026-07-31 11:53:52.468658+00
4	admin@doctorx.com.bd	$2b$12$ozP9J.avIWYojlMP0lxSoeDwluLX.c6gpi8tVbOU1EDlFbwsMoLga	Admin	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-07-31 11:50:26.015392+00	2026-07-31 11:50:26.015392+00
6	patient@example.com	$2b$12$dPUySYLNwW1y1kRVnsMYludbqS.R5J3AcvjTaGE9aTkiQfEcRG4MS	Test Patient Donor	patient	\N	+8801722613281	\N	\N	O+	Rangpur	Bangladesh	Rangpur	\N	\N	/objects/uploads/general/8c07626a-35bd-4702-89c5-762156a5ad24	\N	\N	\N	true	available	2026-06-01	\N	2026-07-31 11:50:26.772668+00	2026-08-07 18:08:50.172+00
8	appleroy@gmail.com	$2b$12$oXF.v4gV2GNE38JUBeg0Be84wgDemENXC3Qw6EyJRM/AsIG9O129a	Dr.Apple Roy 	doctor	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-08-07 18:13:38.710715+00	2026-08-07 18:13:38.714+00
9	ahammedrubel81@gmail.com	$2b$12$2Ou5UqlPW7JNYGLRDit8c./xNSzo.6Y7H1EspL./oLQLQM7siiFne	ahammed Rubel	patient	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	true	available	2026-04-08	\N	2026-08-07 18:19:53.431105+00	2026-08-07 18:20:53.316+00
10	RAJU@GMAIL.COM	$2b$12$z1N/FSdyz1H36erJo2sP7ecEDKybU3YsX.772k0hP8i1awYup.g2q	RAJU	driver	\N	+8801722613281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	false	inactive	\N	\N	2026-08-07 18:24:05.616173+00	2026-08-07 18:24:05.616173+00
\.


--
-- Data for Name: video_promotions; Type: TABLE DATA; Schema: public; Owner: doctorx
--

COPY public.video_promotions (id, title, video_url, thumbnail_url, "position", is_active, display_order, priority, desktop_width, desktop_height, mobile_width, mobile_height, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_otp_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.admin_otp_codes_id_seq', 1, false);


--
-- Name: adsense_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.adsense_slots_id_seq', 168, true);


--
-- Name: advertisements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.advertisements_id_seq', 1, false);


--
-- Name: ambulance_drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.ambulance_drivers_id_seq', 2, true);


--
-- Name: ambulance_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.ambulance_ratings_id_seq', 1, false);


--
-- Name: ambulance_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.ambulance_requests_id_seq', 1, true);


--
-- Name: ambulance_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.ambulance_settings_id_seq', 1, true);


--
-- Name: ambulance_vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.ambulance_vehicles_id_seq', 2, true);


--
-- Name: app_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.app_settings_id_seq', 1, true);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, true);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 16, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.banners_id_seq', 1, false);


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.blog_posts_id_seq', 1, false);


--
-- Name: blood_donor_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.blood_donor_conversations_id_seq', 1, true);


--
-- Name: blood_donor_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.blood_donor_messages_id_seq', 2, true);


--
-- Name: blood_donor_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.blood_donor_requests_id_seq', 1, true);


--
-- Name: calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.calculators_id_seq', 1, false);


--
-- Name: chat_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.chat_conversations_id_seq', 1, false);


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.cities_id_seq', 130, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.countries_id_seq', 55, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.departments_id_seq', 27, true);


--
-- Name: doctor_availability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctor_availability_id_seq', 1, false);


--
-- Name: doctor_connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctor_connections_id_seq', 1, true);


--
-- Name: doctor_consultations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctor_consultations_id_seq', 1, false);


--
-- Name: doctor_notices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctor_notices_id_seq', 1, false);


--
-- Name: doctor_rx_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctor_rx_settings_id_seq', 1, false);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.doctors_id_seq', 3, true);


--
-- Name: driver_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.driver_locations_id_seq', 1, true);


--
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.email_logs_id_seq', 5, true);


--
-- Name: emergency_blood_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.emergency_blood_requests_id_seq', 1, false);


--
-- Name: emergency_contact_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.emergency_contact_reports_id_seq', 1, false);


--
-- Name: emergency_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.emergency_contacts_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: medicines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.medicines_id_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 20, true);


--
-- Name: migration_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.migration_batches_id_seq', 1, false);


--
-- Name: migration_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.migration_records_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.notifications_id_seq', 18, true);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 1, false);


--
-- Name: patient_referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.patient_referrals_id_seq', 1, false);


--
-- Name: patient_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.patient_reviews_id_seq', 1, false);


--
-- Name: payment_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.payment_gateways_id_seq', 252, true);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.payment_transactions_id_seq', 1, false);


--
-- Name: prescription_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.prescription_items_id_seq', 2, true);


--
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 2, true);


--
-- Name: queue_display_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.queue_display_devices_id_seq', 1, false);


--
-- Name: queue_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.queue_entries_id_seq', 1, true);


--
-- Name: rx_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.rx_templates_id_seq', 1, false);


--
-- Name: shop_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.shop_cart_id_seq', 1, false);


--
-- Name: shop_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.shop_order_items_id_seq', 1, false);


--
-- Name: shop_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.shop_orders_id_seq', 1, false);


--
-- Name: shop_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.shop_products_id_seq', 1, false);


--
-- Name: shop_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.shop_wishlist_id_seq', 1, false);


--
-- Name: sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.sliders_id_seq', 1, false);


--
-- Name: sms_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.sms_logs_id_seq', 1, true);


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.specialties_id_seq', 27, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 2, true);


--
-- Name: tool_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.tool_categories_id_seq', 6, true);


--
-- Name: tool_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.tool_favorites_id_seq', 1, false);


--
-- Name: tool_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.tool_usage_id_seq', 1, false);


--
-- Name: tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.tools_id_seq', 1, false);


--
-- Name: user_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.user_addresses_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: video_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doctorx
--

SELECT pg_catalog.setval('public.video_promotions_id_seq', 1, false);


--
-- Name: admin_otp_codes admin_otp_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.admin_otp_codes
    ADD CONSTRAINT admin_otp_codes_pkey PRIMARY KEY (id);


--
-- Name: adsense_slots adsense_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.adsense_slots
    ADD CONSTRAINT adsense_slots_pkey PRIMARY KEY (id);


--
-- Name: adsense_slots adsense_slots_position_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.adsense_slots
    ADD CONSTRAINT adsense_slots_position_unique UNIQUE ("position");


--
-- Name: advertisements advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_pkey PRIMARY KEY (id);


--
-- Name: ambulance_drivers ambulance_drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_drivers
    ADD CONSTRAINT ambulance_drivers_pkey PRIMARY KEY (id);


--
-- Name: ambulance_ratings ambulance_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_ratings
    ADD CONSTRAINT ambulance_ratings_pkey PRIMARY KEY (id);


--
-- Name: ambulance_requests ambulance_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_requests
    ADD CONSTRAINT ambulance_requests_pkey PRIMARY KEY (id);


--
-- Name: ambulance_settings ambulance_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_settings
    ADD CONSTRAINT ambulance_settings_pkey PRIMARY KEY (id);


--
-- Name: ambulance_vehicles ambulance_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_vehicles
    ADD CONSTRAINT ambulance_vehicles_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_slug_unique UNIQUE (slug);


--
-- Name: blood_donor_conversations blood_donor_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_conversations
    ADD CONSTRAINT blood_donor_conversations_pkey PRIMARY KEY (id);


--
-- Name: blood_donor_messages blood_donor_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_messages
    ADD CONSTRAINT blood_donor_messages_pkey PRIMARY KEY (id);


--
-- Name: blood_donor_requests blood_donor_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.blood_donor_requests
    ADD CONSTRAINT blood_donor_requests_pkey PRIMARY KEY (id);


--
-- Name: calculators calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.calculators
    ADD CONSTRAINT calculators_pkey PRIMARY KEY (id);


--
-- Name: calculators calculators_slug_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.calculators
    ADD CONSTRAINT calculators_slug_unique UNIQUE (slug);


--
-- Name: chat_conversations chat_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.chat_conversations
    ADD CONSTRAINT chat_conversations_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: doctor_availability doctor_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_availability
    ADD CONSTRAINT doctor_availability_pkey PRIMARY KEY (id);


--
-- Name: doctor_connections doctor_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_connections
    ADD CONSTRAINT doctor_connections_pkey PRIMARY KEY (id);


--
-- Name: doctor_consultations doctor_consultations_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_consultations
    ADD CONSTRAINT doctor_consultations_pkey PRIMARY KEY (id);


--
-- Name: doctor_notices doctor_notices_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_notices
    ADD CONSTRAINT doctor_notices_pkey PRIMARY KEY (id);


--
-- Name: doctor_rx_settings doctor_rx_settings_doctor_id_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_rx_settings
    ADD CONSTRAINT doctor_rx_settings_doctor_id_unique UNIQUE (doctor_id);


--
-- Name: doctor_rx_settings doctor_rx_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctor_rx_settings
    ADD CONSTRAINT doctor_rx_settings_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: driver_locations driver_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.driver_locations
    ADD CONSTRAINT driver_locations_pkey PRIMARY KEY (id);


--
-- Name: email_logs email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: emergency_blood_requests emergency_blood_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_blood_requests
    ADD CONSTRAINT emergency_blood_requests_pkey PRIMARY KEY (id);


--
-- Name: emergency_contact_reports emergency_contact_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_contact_reports
    ADD CONSTRAINT emergency_contact_reports_pkey PRIMARY KEY (id);


--
-- Name: emergency_contacts emergency_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_contacts
    ADD CONSTRAINT emergency_contacts_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: medicines medicines_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: migration_batches migration_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.migration_batches
    ADD CONSTRAINT migration_batches_pkey PRIMARY KEY (id);


--
-- Name: migration_records migration_records_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.migration_records
    ADD CONSTRAINT migration_records_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_token_unique UNIQUE (token);


--
-- Name: patient_referrals patient_referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.patient_referrals
    ADD CONSTRAINT patient_referrals_pkey PRIMARY KEY (id);


--
-- Name: patient_reviews patient_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.patient_reviews
    ADD CONSTRAINT patient_reviews_pkey PRIMARY KEY (id);


--
-- Name: payment_gateways payment_gateways_gateway_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_gateways
    ADD CONSTRAINT payment_gateways_gateway_unique UNIQUE (gateway);


--
-- Name: payment_gateways payment_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_gateways
    ADD CONSTRAINT payment_gateways_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_tran_id_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_tran_id_unique UNIQUE (tran_id);


--
-- Name: prescription_items prescription_items_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT prescription_items_pkey PRIMARY KEY (id);


--
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (id);


--
-- Name: queue_display_devices queue_display_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.queue_display_devices
    ADD CONSTRAINT queue_display_devices_pkey PRIMARY KEY (id);


--
-- Name: queue_entries queue_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.queue_entries
    ADD CONSTRAINT queue_entries_pkey PRIMARY KEY (id);


--
-- Name: rx_templates rx_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.rx_templates
    ADD CONSTRAINT rx_templates_pkey PRIMARY KEY (id);


--
-- Name: shop_cart shop_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_pkey PRIMARY KEY (id);


--
-- Name: shop_order_items shop_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_order_items
    ADD CONSTRAINT shop_order_items_pkey PRIMARY KEY (id);


--
-- Name: shop_orders shop_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_orders
    ADD CONSTRAINT shop_orders_pkey PRIMARY KEY (id);


--
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Name: shop_wishlist shop_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_wishlist
    ADD CONSTRAINT shop_wishlist_pkey PRIMARY KEY (id);


--
-- Name: sliders sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (id);


--
-- Name: sms_logs sms_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.sms_logs
    ADD CONSTRAINT sms_logs_pkey PRIMARY KEY (id);


--
-- Name: specialties specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tool_categories tool_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_categories
    ADD CONSTRAINT tool_categories_pkey PRIMARY KEY (id);


--
-- Name: tool_categories tool_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_categories
    ADD CONSTRAINT tool_categories_slug_unique UNIQUE (slug);


--
-- Name: tool_favorites tool_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_favorites
    ADD CONSTRAINT tool_favorites_pkey PRIMARY KEY (id);


--
-- Name: tool_usage tool_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_usage
    ADD CONSTRAINT tool_usage_pkey PRIMARY KEY (id);


--
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (id);


--
-- Name: tools tools_slug_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_slug_unique UNIQUE (slug);


--
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video_promotions video_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.video_promotions
    ADD CONSTRAINT video_promotions_pkey PRIMARY KEY (id);


--
-- Name: medicines_brand_idx; Type: INDEX; Schema: public; Owner: doctorx
--

CREATE INDEX medicines_brand_idx ON public.medicines USING btree (brand_name);


--
-- Name: medicines_generic_idx; Type: INDEX; Schema: public; Owner: doctorx
--

CREATE INDEX medicines_generic_idx ON public.medicines USING btree (generic_name);


--
-- Name: tool_favorites_doctor_tool_idx; Type: INDEX; Schema: public; Owner: doctorx
--

CREATE UNIQUE INDEX tool_favorites_doctor_tool_idx ON public.tool_favorites USING btree (doctor_id, tool_id);


--
-- Name: tool_usage_doctor_tool_idx; Type: INDEX; Schema: public; Owner: doctorx
--

CREATE UNIQUE INDEX tool_usage_doctor_tool_idx ON public.tool_usage USING btree (doctor_id, tool_id);


--
-- Name: ambulance_ratings ambulance_ratings_driver_id_ambulance_drivers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_ratings
    ADD CONSTRAINT ambulance_ratings_driver_id_ambulance_drivers_id_fk FOREIGN KEY (driver_id) REFERENCES public.ambulance_drivers(id);


--
-- Name: ambulance_ratings ambulance_ratings_request_id_ambulance_requests_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_ratings
    ADD CONSTRAINT ambulance_ratings_request_id_ambulance_requests_id_fk FOREIGN KEY (request_id) REFERENCES public.ambulance_requests(id) ON DELETE CASCADE;


--
-- Name: ambulance_requests ambulance_requests_driver_id_ambulance_drivers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_requests
    ADD CONSTRAINT ambulance_requests_driver_id_ambulance_drivers_id_fk FOREIGN KEY (driver_id) REFERENCES public.ambulance_drivers(id);


--
-- Name: ambulance_requests ambulance_requests_vehicle_id_ambulance_vehicles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_requests
    ADD CONSTRAINT ambulance_requests_vehicle_id_ambulance_vehicles_id_fk FOREIGN KEY (vehicle_id) REFERENCES public.ambulance_vehicles(id);


--
-- Name: ambulance_vehicles ambulance_vehicles_driver_id_ambulance_drivers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.ambulance_vehicles
    ADD CONSTRAINT ambulance_vehicles_driver_id_ambulance_drivers_id_fk FOREIGN KEY (driver_id) REFERENCES public.ambulance_drivers(id) ON DELETE CASCADE;


--
-- Name: driver_locations driver_locations_driver_id_ambulance_drivers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.driver_locations
    ADD CONSTRAINT driver_locations_driver_id_ambulance_drivers_id_fk FOREIGN KEY (driver_id) REFERENCES public.ambulance_drivers(id) ON DELETE CASCADE;


--
-- Name: emergency_contact_reports emergency_contact_reports_contact_id_emergency_contacts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.emergency_contact_reports
    ADD CONSTRAINT emergency_contact_reports_contact_id_emergency_contacts_id_fk FOREIGN KEY (contact_id) REFERENCES public.emergency_contacts(id) ON DELETE CASCADE;


--
-- Name: shop_cart shop_cart_product_id_shop_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_product_id_shop_products_id_fk FOREIGN KEY (product_id) REFERENCES public.shop_products(id) ON DELETE CASCADE;


--
-- Name: shop_cart shop_cart_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: shop_order_items shop_order_items_order_id_shop_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_order_items
    ADD CONSTRAINT shop_order_items_order_id_shop_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.shop_orders(id) ON DELETE CASCADE;


--
-- Name: shop_order_items shop_order_items_product_id_shop_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_order_items
    ADD CONSTRAINT shop_order_items_product_id_shop_products_id_fk FOREIGN KEY (product_id) REFERENCES public.shop_products(id);


--
-- Name: shop_orders shop_orders_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_orders
    ADD CONSTRAINT shop_orders_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: shop_wishlist shop_wishlist_product_id_shop_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_wishlist
    ADD CONSTRAINT shop_wishlist_product_id_shop_products_id_fk FOREIGN KEY (product_id) REFERENCES public.shop_products(id) ON DELETE CASCADE;


--
-- Name: shop_wishlist shop_wishlist_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.shop_wishlist
    ADD CONSTRAINT shop_wishlist_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tool_favorites tool_favorites_tool_id_tools_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_favorites
    ADD CONSTRAINT tool_favorites_tool_id_tools_id_fk FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: tool_usage tool_usage_tool_id_tools_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tool_usage
    ADD CONSTRAINT tool_usage_tool_id_tools_id_fk FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: tools tools_category_id_tool_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_category_id_tool_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.tool_categories(id) ON DELETE SET NULL;


--
-- Name: user_addresses user_addresses_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doctorx
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict cCrgX7scwC54UwLan1Uq2ObacWieAXUKrIZTu63K6LdnAz9V4W4vlXqXB7G1BDC

