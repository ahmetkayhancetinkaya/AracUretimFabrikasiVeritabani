--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12rc1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AracUretim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AracUretim" (
    "SaseNo" character varying(10)[] NOT NULL,
    "BantId" integer NOT NULL,
    "ParcaSeriNo" character varying(200)[] NOT NULL
);


ALTER TABLE public."AracUretim" OWNER TO postgres;

--
-- Name: AraçKataloğu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AraçKataloğu" (
    "AraçId" integer NOT NULL,
    "VitesId" integer NOT NULL,
    "KoltukSayısı" integer NOT NULL,
    "AraçTürId" integer NOT NULL,
    "YakıtTürüId" integer NOT NULL,
    "ModelId" integer NOT NULL,
    "ÜretimYılı" integer NOT NULL,
    "AraçResmi" bytea NOT NULL,
    "AraçBilgisi" character varying(200)[] NOT NULL,
    "RenkId" integer NOT NULL,
    "Fiyat" bigint NOT NULL
);


ALTER TABLE public."AraçKataloğu" OWNER TO postgres;

--
-- Name: AraçTürü; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AraçTürü" (
    "AraçTürId" integer NOT NULL,
    "AraçTürAdı" character varying(44)[] NOT NULL
);


ALTER TABLE public."AraçTürü" OWNER TO postgres;

--
-- Name: DepartmanBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DepartmanBilgileri" (
    "DepartmanId" integer NOT NULL,
    "DepartmanAdı" character varying(30)[] NOT NULL
);


ALTER TABLE public."DepartmanBilgileri" OWNER TO postgres;

--
-- Name: FirmaBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FirmaBilgileri" (
    "FirmaId" integer NOT NULL,
    "FirmaAdı" character varying(30)[] NOT NULL,
    "ÜlkeId" integer NOT NULL,
    "FirmaTelefon" character varying(30)[] NOT NULL,
    "FirmaAdres" character varying(150)[] NOT NULL,
    "Eposta" character varying(50)[] NOT NULL
);


ALTER TABLE public."FirmaBilgileri" OWNER TO postgres;

--
-- Name: KimlikBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KimlikBilgileri" (
    "KimlikId" integer NOT NULL,
    "Ad" character varying(30)[] NOT NULL,
    "Soyad" character varying(30)[] NOT NULL,
    "PersonelId" integer NOT NULL,
    "Telefon" character varying(30)[] NOT NULL,
    "DoğumTarihi" date NOT NULL,
    "TcKimlikNo" bigint NOT NULL,
    "DoğumYeri" character varying(50)[] NOT NULL,
    "Adres" character varying(200)[] NOT NULL
);


ALTER TABLE public."KimlikBilgileri" OWNER TO postgres;

--
-- Name: Lojistik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lojistik" (
    "LojistikFirmaId" integer NOT NULL,
    "SiparisId" integer NOT NULL,
    "PersonelId" integer NOT NULL,
    "ÇıkışTarihi" date NOT NULL,
    "TeslimTarihi" date NOT NULL,
    "Fiyat" money NOT NULL
);


ALTER TABLE public."Lojistik" OWNER TO postgres;

--
-- Name: Model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Model" (
    "ModelId" integer NOT NULL,
    "ModelAdı" character varying(48)[] NOT NULL
);


ALTER TABLE public."Model" OWNER TO postgres;

--
-- Name: ParçaAlım; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ParçaAlım" (
    "ParçaSeriNo" character varying(200)[] NOT NULL,
    "PKategoriId" integer NOT NULL,
    "ModelId" integer NOT NULL,
    "FirmaId" integer NOT NULL,
    "Adet" integer NOT NULL,
    "AlımFiyatı" money NOT NULL
);


ALTER TABLE public."ParçaAlım" OWNER TO postgres;

--
-- Name: ParçaKategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ParçaKategori" (
    "PkategoriId" integer NOT NULL,
    "KategoriAdı" character varying(200)[] NOT NULL,
    "YakıtTürId" integer
);


ALTER TABLE public."ParçaKategori" OWNER TO postgres;

--
-- Name: PersonelBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PersonelBilgileri" (
    "PersonelId" integer NOT NULL,
    "İşBaşlangıçTarihi" date NOT NULL,
    "Maaş" bigint NOT NULL,
    "DepartmanId" integer NOT NULL
);


ALTER TABLE public."PersonelBilgileri" OWNER TO postgres;

--
-- Name: RenkBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RenkBilgileri" (
    "RenkId" integer NOT NULL,
    "RenkAdı" character varying(30)[] NOT NULL
);


ALTER TABLE public."RenkBilgileri" OWNER TO postgres;

--
-- Name: SatılanAraclar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SatılanAraclar" (
    "SiparisId" integer NOT NULL,
    "SaseNo" character varying(10)[] NOT NULL
);


ALTER TABLE public."SatılanAraclar" OWNER TO postgres;

--
-- Name: SiparisBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiparisBilgileri" (
    "SiparisId" integer NOT NULL,
    "FirmaId" integer NOT NULL,
    "SiparisTarihi" date NOT NULL,
    "PersonelId" integer NOT NULL
);


ALTER TABLE public."SiparisBilgileri" OWNER TO postgres;

--
-- Name: SiparisUrun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiparisUrun" (
    "SiparisId" integer NOT NULL,
    "AraçId" integer NOT NULL,
    "Adet" integer NOT NULL,
    "Fiyat" money NOT NULL
);


ALTER TABLE public."SiparisUrun" OWNER TO postgres;

--
-- Name: StokDurumu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StokDurumu" (
    "StokId" integer NOT NULL,
    "AraçId" integer NOT NULL,
    "StokAdedi" integer NOT NULL,
    "Durum" bit(1) NOT NULL
);


ALTER TABLE public."StokDurumu" OWNER TO postgres;

--
-- Name: Test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Test" (
    "TestId" integer NOT NULL,
    "SaseNo" character varying(10)[] NOT NULL,
    "PersonelId" integer NOT NULL
);


ALTER TABLE public."Test" OWNER TO postgres;

--
-- Name: UretimBantları; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UretimBantları" (
    "BantId" integer NOT NULL,
    "BantAdı" character varying(40)[] NOT NULL
);


ALTER TABLE public."UretimBantları" OWNER TO postgres;

--
-- Name: Vites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vites" (
    "VitesId" integer NOT NULL,
    "VitesAdı" character varying(78) NOT NULL
);


ALTER TABLE public."Vites" OWNER TO postgres;

--
-- Name: Yakıttürü; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yakıttürü" (
    "YakıtTürId" integer NOT NULL,
    "YakıtTürAdı" character varying(74)[] NOT NULL
);


ALTER TABLE public."Yakıttürü" OWNER TO postgres;

--
-- Name: YapılanAraclar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."YapılanAraclar" (
    "SaseNo" character varying(10)[] NOT NULL,
    "AracId" integer NOT NULL,
    "AracTürId" integer NOT NULL,
    "Personeld" integer NOT NULL
);


ALTER TABLE public."YapılanAraclar" OWNER TO postgres;

--
-- Name: ÜlkeBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ÜlkeBilgileri" (
    "ÜlkeId" integer NOT NULL,
    "ÜlkeAdı" character varying(44)[] NOT NULL
);


ALTER TABLE public."ÜlkeBilgileri" OWNER TO postgres;

--
-- Data for Name: AracUretim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AracUretim" VALUES
	('{1A2B3C4D5E}', 4, '{C180M}'),
	('{1A2B3C4D5E}', 4, '{C180E}'),
	('{1A2B3C4D5E}', 5, '{C180Ş}'),
	('{1A2B3C4D5E}', 4, '{C180K}'),
	('{E5D4C3B2A1}', 4, '{C180M}'),
	('{E5D4C3B2A1}', 4, '{C180E}'),
	('{E5D4C3B2A1}', 5, '{C180Ş}'),
	('{E5D4C3B2A1}', 4, '{C180K}'),
	('{2KM345ABCD}', 4, '{E250M}');


--
-- Data for Name: AraçKataloğu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AraçKataloğu" VALUES
	(1, 1, 5, 1, 1, 1, 2016, '\x', '{"Şıklığı ve zarifliğinin yanı sıra performans olarakta iyi olan bir araba"}', 3, 180000),
	(2, 2, 5, 1, 2, 1, 2017, '\x', '{"Şıklığı ve zarifliğinin yanı sıra performans olarakta iyi olan bir araba"}', 4, 200000),
	(3, 1, 5, 1, 1, 2, 2016, '\x', '{"E serisinin vazgeçilmez bir ürünü bir araç."}', 1, 250000),
	(4, 2, 5, 1, 2, 2, 2015, '\x', '{"E serisinin vazgeçilmez bir ürünü bir araç."}', 2, 230000),
	(5, 1, 20, 2, 1, 3, 2017, '\x', '{"Minibüsçülerin vazgeçilmez arabası olan Sprinter yolcuların konforuna önem vermektir."}', 3, 270000),
	(6, 2, 20, 2, 3, 3, 2017, '\x', '{"Minibüsçülerin vazgeçilmez arabası olan Sprinter yolcuların konforuna önem vermektir."}', 4, 280000),
	(7, 3, 10, 3, 1, 4, 2016, '\x', '{"Tam bir aile arabası olmasının yanı sıra iş arabası."}', 5, 120000),
	(8, 1, 10, 3, 3, 4, 2015, '\x', '{"Tam bir aile arabası olmasının yanı sıra iş arabası."}', 1, 110000),
	(9, 2, 42, 4, 2, 5, 2017, '\x', '{"42 Kişilik yolcu taşıma kapasitesi ile güvenli şehirlerarası yolculuk sağlar."}', 2, 400000),
	(10, 3, 42, 4, 1, 5, 2017, '\x', '{"42 Kişilik yolcu taşıma kapasitesi ile güvenli şehirlerarası yolculuk sağlar."}', 3, 420000);


--
-- Data for Name: AraçTürü; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AraçTürü" VALUES
	(1, '{Binek}'),
	(2, '{Minibüs}'),
	(3, '{Kamyonet}'),
	(4, '{Otobüs}');


--
-- Data for Name: DepartmanBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DepartmanBilgileri" VALUES
	(1, '{Lojistik}'),
	(2, '{Boyahane}'),
	(3, '{Montaj}'),
	(4, '{Kaynak}'),
	(5, '{Pres}'),
	(6, '{Test}'),
	(7, '{Satış}'),
	(8, '{Kontrol}');


--
-- Data for Name: FirmaBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."FirmaBilgileri" VALUES
	(1, '{"JET .LTD"}', 1, '{816578997776}', '{"222 NODA 3 NAGAKAWA NAGOYA PREFFERİCE 43"}', '{jet@yahoo.com}'),
	(2, '{"SUNTECH .LTD"}', 2, '{+82-2-6376-5656}', '{85,"S Askerova Street BAKU 370009 AZERBAUAN"}', '{suntech@gmail.com}'),
	(3, '{"AZTEK .LTD"}', 3, '{"994 14 14 00 84"}', '{"NORTH DAXUE RD ZHENGZHOU"}', '{aztek@hotmail.com}'),
	(4, '{GIANTS-COMPANY}', 4, '{"7 772 33 11 74"}', '{"R.F BELGOROD GLAVPOCHTAMT .P.B 7"}', '{gıantscomp@gmail.com}'),
	(5, '{"I.R.A.V . AG"}', 5, '{"+41 41 7264278"}', '{"Industurıalstrasse 47 CH 6300 Zug. Schweiz"}', '{ıravag@yahoo.com}'),
	(6, '{LANTOR}', 6, '{"9-7214 3 3  11-74"}', '{"R.F BELGOROD GLAVPOCHTAMT .P.B 11"}', '{lantor@gmail.com}'),
	(7, '{"ULAŞ AŞ"}', 7, '{02128766658}', '{"Beşitaş Mahallesi Jet Sokak no:22"}', '{ulaşaş@icloud.com}'),
	(8, '{"HIZ AŞ"}', 7, '{02163677996}', '{"Kara Mahallesi Beytek Sokak no:47"}', '{hızaş@gmail.com}'),
	(9, '{TrSpeed}', 7, '{02125865253}', '{"Sert Mahallesi Boyner Sokak no:78"}', '{trspeed@gmail.com}');


--
-- Data for Name: KimlikBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KimlikBilgileri" VALUES
	(1, '{Ceylan}', '{Yıldız}', 1, '{05332841053}', '1994-01-27', 12345678980, '{Bursa}', '{"Tepe mahallesi tork sokak no:44 daire:7"}'),
	(2, '{Kayhan}', '{Çetinkaya}', 2, '{05543831243}', '1997-01-28', 55456852397, '{İzmir}', '{"Yunus Emre mahallesi musalla sokak no:2 daire:2"}'),
	(3, '{Furkan}', '{Karakaya}', 3, '{05431235042}', '1992-11-14', 43786547612, '{İstanbul}', '{"Tarakça mahallesi saka sokak no:5 daire:2"}'),
	(4, '{Arif}', '{Adıgüzel}', 4, '{04328765674}', '1993-12-17', 13243564875, '{Ordu}', '{"Fatih mahallesi merkez sokak no:34 daire:11w"}'),
	(5, '{Ece}', '{Pek}', 5, '{06543297546}', '1995-12-02', 54378965422, '{Maltepe}', '{"Gülsuyu mahallesi çıkmaz sokak no:5"}'),
	(6, '{Damla}', '{Aydın}', 6, '{05478654342}', '1991-02-25', 98765436511, '{Erzurum}', '{"Kardeşler mahallesi hisar sokak no:7 daire:3"}'),
	(7, '{Yusuf}', '{Hara}', 7, '{05446578579}', '1990-02-21', 14763297654, '{Sivas}', '{"Bestekar sokak kuşçu mahallesi no:7"}'),
	(9, '{Merve}', '{Derici}', 8, '{05433236754}', '1992-05-03', 76892346598, '{Van}', '{"Kartaltepe mahallesi yetiş sokak no:22"}');


--
-- Data for Name: Lojistik; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lojistik" VALUES
	(7, 1, 8, '2017-05-05', '2017-05-10', '?10.000,00'),
	(8, 2, 8, '2017-06-06', '2017-06-12', '?20.000,00'),
	(9, 3, 8, '2017-04-12', '2017-04-22', '?15.000,00'),
	(7, 4, 8, '2017-07-07', '2017-07-10', '?15.000,00'),
	(8, 5, 8, '2017-07-25', '2017-08-01', '?12.000,00'),
	(9, 6, 8, '2017-07-15', '2017-07-30', '?14.000,00');


--
-- Data for Name: Model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Model" VALUES
	(1, '{C180}'),
	(2, '{E250}'),
	(3, '{Sprinter}'),
	(4, '{Vito}'),
	(5, '{Travego}');


--
-- Data for Name: ParçaAlım; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ParçaAlım" VALUES
	('{C180E}', 2, 1, 1, 20, '?100.000,00'),
	('{C180K}', 4, 1, 1, 50, '?50.000,00'),
	('{C180M}', 1, 1, 1, 10, '?100.000,00'),
	('{C180Ş}', 3, 1, 1, 10, '?50.000,00'),
	('{E250E}', 2, 2, 1, 20, '?120.000,00'),
	('{E250K}', 4, 2, 1, 50, '?100.000,00'),
	('{E250M}', 5, 2, 1, 10, '?110.000,00'),
	('{E250Ş}', 3, 2, 1, 10, '?60.000,00'),
	('{SpE}', 2, 3, 2, 20, '?140.000,00'),
	('{SpK}', 4, 3, 2, 50, '?150.000,00'),
	('{SpM}', 1, 3, 2, 10, '?120.000,00'),
	('{SpŞ}', 3, 3, 2, 10, '?70.000,00'),
	('{TraE}', 2, 5, 1, 20, '?180.000,00'),
	('{TraK}', 4, 5, 1, 50, '?250.000,00'),
	('{TraM}', 1, 5, 1, 10, '?140.000,00'),
	('{TraŞ}', 3, 5, 1, 10, '?90.000,00'),
	('{VitE}', 2, 4, 3, 20, '?160.000,00'),
	('{VitK}', 4, 4, 3, 50, '?200.000,00'),
	('{VitM}', 1, 4, 3, 10, '?130.000,00'),
	('{VitŞ}', 3, 4, 3, 10, '?80.000,00');


--
-- Data for Name: ParçaKategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ParçaKategori" VALUES
	(1, '{Motor}', 1),
	(2, '{Egsoz}', NULL),
	(3, '{Şanzuman}', NULL),
	(4, '{Kapı}', NULL),
	(5, '{Motor}', 2);


--
-- Data for Name: PersonelBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."PersonelBilgileri" VALUES
	(1, '2014-03-20', 2500, 1),
	(2, '2013-04-10', 2200, 2),
	(3, '2016-07-05', 2300, 3),
	(4, '2015-12-15', 2100, 4),
	(5, '2013-08-23', 2600, 5),
	(6, '2014-06-10', 2400, 6),
	(8, '2015-02-15', 2000, 7),
	(7, '2011-07-20', 2700, 8);


--
-- Data for Name: RenkBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RenkBilgileri" VALUES
	(1, '{Beyaz}'),
	(2, '{Siyah}'),
	(3, '{Kırmızı}'),
	(4, '{Mavi}'),
	(5, '{Gümüş}');


--
-- Data for Name: SatılanAraclar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SatılanAraclar" VALUES
	(1, '{E5D4C3B2A1}'),
	(2, '{6743CBA215}'),
	(3, '{512ABC3476}'),
	(4, '{DCBA543MK2}'),
	(5, '{1A2B3C4D5E}'),
	(6, '{97DF6B74C3}');


--
-- Data for Name: SiparisBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SiparisBilgileri" VALUES
	(1, 4, '2017-02-02', 7),
	(2, 5, '2017-03-03', 7),
	(3, 6, '2017-04-04', 7),
	(4, 4, '2017-04-02', 7),
	(5, 4, '2017-01-01', 7),
	(6, 6, '2017-01-12', 7);


--
-- Data for Name: SiparisUrun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SiparisUrun" VALUES
	(1, 2, 1, '?200.000,00'),
	(2, 10, 1, '?420.000,00'),
	(3, 9, 1, '?400.000,00'),
	(4, 3, 1, '?250.000,00'),
	(5, 1, 1, '?180.000,00'),
	(6, 5, 1, '?270.000,00');


--
-- Data for Name: StokDurumu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."StokDurumu" VALUES
	(1, 1, 1, B'1'),
	(2, 2, 1, B'1'),
	(3, 3, 1, B'1'),
	(4, 4, 2, B'1'),
	(5, 5, 1, B'1'),
	(6, 6, 2, B'1'),
	(7, 7, 2, B'1'),
	(8, 8, 2, B'1'),
	(9, 9, 1, B'1'),
	(10, 10, 1, B'1');


--
-- Data for Name: Test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Test" VALUES
	(1, '{1A2B3C4D5E}', 6),
	(2, '{2KM345ABCD}', 6),
	(3, '{3C47BB6FD7}', 6),
	(4, '{47AE16ME87}', 6),
	(5, '{512ABC3476}', 6),
	(6, '{6743CBA215}', 6),
	(7, '{78EM61EA74}', 6),
	(8, '{97DF6B74C3}', 6),
	(9, '{DCBA543MK2}', 6);


--
-- Data for Name: UretimBantları; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UretimBantları" VALUES
	(1, '{Pres}'),
	(2, '{Boya}'),
	(3, '{Kaynak}'),
	(4, '{Montaj}'),
	(5, '{GövdeEşleştirme}');


--
-- Data for Name: Vites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Vites" VALUES
	(1, '{Otomatik}'),
	(2, '{YarıOtomatik}'),
	(3, '{Manuel}');


--
-- Data for Name: Yakıttürü; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Yakıttürü" VALUES
	(1, '{Dizel}'),
	(2, '{Benzinli}'),
	(3, '{Elektrikli}');


--
-- Data for Name: YapılanAraclar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."YapılanAraclar" VALUES
	('{1A2B3C4D5E}', 1, 1, 7),
	('{2KM345ABCD}', 2, 1, 7),
	('{3C47BB6FD7}', 3, 2, 7),
	('{47AE16ME87}', 4, 3, 7),
	('{512ABC3476}', 5, 4, 7),
	('{6743CBA215}', 5, 4, 7),
	('{78EM61EA74}', 4, 3, 7),
	('{97DF6B74C3}', 3, 2, 7),
	('{DCBA543MK2}', 2, 1, 7),
	('{E5D4C3B2A1}', 1, 1, 7);


--
-- Data for Name: ÜlkeBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ÜlkeBilgileri" VALUES
	(1, '{A.B.D}'),
	(2, '{Tayvan}'),
	(3, '{Çin}'),
	(4, '{Polonya}'),
	(5, '{Belçika}'),
	(6, '{Hindistan}'),
	(7, '{Türkiye}');


--
-- Name: AraçKataloğu AraçKataloğu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_pkey" PRIMARY KEY ("AraçId");


--
-- Name: AraçTürü AraçTürü_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçTürü"
    ADD CONSTRAINT "AraçTürü_pkey" PRIMARY KEY ("AraçTürId");


--
-- Name: DepartmanBilgileri DepartmanBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DepartmanBilgileri"
    ADD CONSTRAINT "DepartmanBilgileri_pkey" PRIMARY KEY ("DepartmanId");


--
-- Name: FirmaBilgileri FirmaBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FirmaBilgileri"
    ADD CONSTRAINT "FirmaBilgileri_pkey" PRIMARY KEY ("FirmaId");


--
-- Name: KimlikBilgileri KimlikBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KimlikBilgileri"
    ADD CONSTRAINT "KimlikBilgileri_pkey" PRIMARY KEY ("KimlikId");


--
-- Name: Model Model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Model"
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY ("ModelId");


--
-- Name: ParçaAlım ParçaAlım_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaAlım"
    ADD CONSTRAINT "ParçaAlım_pkey" PRIMARY KEY ("ParçaSeriNo");


--
-- Name: ParçaKategori ParçaKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaKategori"
    ADD CONSTRAINT "ParçaKategori_pkey" PRIMARY KEY ("PkategoriId");


--
-- Name: PersonelBilgileri PersonelBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PersonelBilgileri"
    ADD CONSTRAINT "PersonelBilgileri_pkey" PRIMARY KEY ("PersonelId");


--
-- Name: RenkBilgileri RenkBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RenkBilgileri"
    ADD CONSTRAINT "RenkBilgileri_pkey" PRIMARY KEY ("RenkId");


--
-- Name: SiparisBilgileri SiparisBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisBilgileri"
    ADD CONSTRAINT "SiparisBilgileri_pkey" PRIMARY KEY ("SiparisId");


--
-- Name: StokDurumu StokDurumu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StokDurumu"
    ADD CONSTRAINT "StokDurumu_pkey" PRIMARY KEY ("StokId");


--
-- Name: Test Test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Test"
    ADD CONSTRAINT "Test_pkey" PRIMARY KEY ("TestId");


--
-- Name: UretimBantları UretimBantları_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UretimBantları"
    ADD CONSTRAINT "UretimBantları_pkey" PRIMARY KEY ("BantId");


--
-- Name: Vites Vites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vites"
    ADD CONSTRAINT "Vites_pkey" PRIMARY KEY ("VitesId");


--
-- Name: Yakıttürü Yakıttürü_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yakıttürü"
    ADD CONSTRAINT "Yakıttürü_pkey" PRIMARY KEY ("YakıtTürId");


--
-- Name: YapılanAraclar YapılanAraclar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YapılanAraclar"
    ADD CONSTRAINT "YapılanAraclar_pkey" PRIMARY KEY ("SaseNo");


--
-- Name: ÜlkeBilgileri ÜlkeBilgileri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ÜlkeBilgileri"
    ADD CONSTRAINT "ÜlkeBilgileri_pkey" PRIMARY KEY ("ÜlkeId");


--
-- Name: AracUretim AracUretim_BantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AracUretim"
    ADD CONSTRAINT "AracUretim_BantId_fkey" FOREIGN KEY ("BantId") REFERENCES public."UretimBantları"("BantId");


--
-- Name: AracUretim AracUretim_ParcaSeriNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AracUretim"
    ADD CONSTRAINT "AracUretim_ParcaSeriNo_fkey" FOREIGN KEY ("ParcaSeriNo") REFERENCES public."ParçaAlım"("ParçaSeriNo");


--
-- Name: AracUretim AracUretim_SaseNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AracUretim"
    ADD CONSTRAINT "AracUretim_SaseNo_fkey" FOREIGN KEY ("SaseNo") REFERENCES public."YapılanAraclar"("SaseNo");


--
-- Name: AraçKataloğu AraçKataloğu_AraçTürId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_AraçTürId_fkey" FOREIGN KEY ("AraçTürId") REFERENCES public."AraçTürü"("AraçTürId");


--
-- Name: AraçKataloğu AraçKataloğu_ModelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_ModelId_fkey" FOREIGN KEY ("ModelId") REFERENCES public."Model"("ModelId");


--
-- Name: AraçKataloğu AraçKataloğu_RenkId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_RenkId_fkey" FOREIGN KEY ("RenkId") REFERENCES public."RenkBilgileri"("RenkId");


--
-- Name: AraçKataloğu AraçKataloğu_VitesId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_VitesId_fkey" FOREIGN KEY ("VitesId") REFERENCES public."Vites"("VitesId");


--
-- Name: AraçKataloğu AraçKataloğu_YakıtTürüId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AraçKataloğu"
    ADD CONSTRAINT "AraçKataloğu_YakıtTürüId_fkey" FOREIGN KEY ("YakıtTürüId") REFERENCES public."Yakıttürü"("YakıtTürId");


--
-- Name: FirmaBilgileri FirmaBilgileri_ÜlkeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FirmaBilgileri"
    ADD CONSTRAINT "FirmaBilgileri_ÜlkeId_fkey" FOREIGN KEY ("ÜlkeId") REFERENCES public."ÜlkeBilgileri"("ÜlkeId");


--
-- Name: KimlikBilgileri KimlikBilgileri_PersonelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KimlikBilgileri"
    ADD CONSTRAINT "KimlikBilgileri_PersonelId_fkey" FOREIGN KEY ("PersonelId") REFERENCES public."PersonelBilgileri"("PersonelId");


--
-- Name: Lojistik Lojistik_LojistikFirmaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lojistik"
    ADD CONSTRAINT "Lojistik_LojistikFirmaId_fkey" FOREIGN KEY ("LojistikFirmaId") REFERENCES public."FirmaBilgileri"("FirmaId");


--
-- Name: Lojistik Lojistik_PersonelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lojistik"
    ADD CONSTRAINT "Lojistik_PersonelId_fkey" FOREIGN KEY ("PersonelId") REFERENCES public."PersonelBilgileri"("PersonelId");


--
-- Name: Lojistik Lojistik_SiparisId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lojistik"
    ADD CONSTRAINT "Lojistik_SiparisId_fkey" FOREIGN KEY ("SiparisId") REFERENCES public."SiparisBilgileri"("SiparisId");


--
-- Name: ParçaAlım ParçaAlım_FirmaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaAlım"
    ADD CONSTRAINT "ParçaAlım_FirmaId_fkey" FOREIGN KEY ("FirmaId") REFERENCES public."FirmaBilgileri"("FirmaId");


--
-- Name: ParçaAlım ParçaAlım_ModelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaAlım"
    ADD CONSTRAINT "ParçaAlım_ModelId_fkey" FOREIGN KEY ("ModelId") REFERENCES public."Model"("ModelId");


--
-- Name: ParçaAlım ParçaAlım_PKategoriId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaAlım"
    ADD CONSTRAINT "ParçaAlım_PKategoriId_fkey" FOREIGN KEY ("PKategoriId") REFERENCES public."ParçaKategori"("PkategoriId");


--
-- Name: ParçaKategori ParçaKategori_YakıtTürId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ParçaKategori"
    ADD CONSTRAINT "ParçaKategori_YakıtTürId_fkey" FOREIGN KEY ("YakıtTürId") REFERENCES public."Yakıttürü"("YakıtTürId");


--
-- Name: PersonelBilgileri PersonelBilgileri_DepartmanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PersonelBilgileri"
    ADD CONSTRAINT "PersonelBilgileri_DepartmanId_fkey" FOREIGN KEY ("DepartmanId") REFERENCES public."DepartmanBilgileri"("DepartmanId");


--
-- Name: SatılanAraclar SatılanAraclar_SaseNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SatılanAraclar"
    ADD CONSTRAINT "SatılanAraclar_SaseNo_fkey" FOREIGN KEY ("SaseNo") REFERENCES public."YapılanAraclar"("SaseNo");


--
-- Name: SatılanAraclar SatılanAraclar_SiparisId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SatılanAraclar"
    ADD CONSTRAINT "SatılanAraclar_SiparisId_fkey" FOREIGN KEY ("SiparisId") REFERENCES public."SiparisBilgileri"("SiparisId");


--
-- Name: SiparisBilgileri SiparisBilgileri_FirmaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisBilgileri"
    ADD CONSTRAINT "SiparisBilgileri_FirmaId_fkey" FOREIGN KEY ("FirmaId") REFERENCES public."FirmaBilgileri"("FirmaId");


--
-- Name: SiparisBilgileri SiparisBilgileri_PersonelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisBilgileri"
    ADD CONSTRAINT "SiparisBilgileri_PersonelId_fkey" FOREIGN KEY ("PersonelId") REFERENCES public."PersonelBilgileri"("PersonelId");


--
-- Name: SiparisUrun SiparisUrun_AraçId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisUrun"
    ADD CONSTRAINT "SiparisUrun_AraçId_fkey" FOREIGN KEY ("AraçId") REFERENCES public."AraçKataloğu"("AraçId");


--
-- Name: SiparisUrun SiparisUrun_SiparisId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisUrun"
    ADD CONSTRAINT "SiparisUrun_SiparisId_fkey" FOREIGN KEY ("SiparisId") REFERENCES public."SiparisBilgileri"("SiparisId");


--
-- Name: StokDurumu StokDurumu_AraçId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StokDurumu"
    ADD CONSTRAINT "StokDurumu_AraçId_fkey" FOREIGN KEY ("AraçId") REFERENCES public."AraçKataloğu"("AraçId");


--
-- Name: Test Test_PersonelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Test"
    ADD CONSTRAINT "Test_PersonelId_fkey" FOREIGN KEY ("PersonelId") REFERENCES public."PersonelBilgileri"("PersonelId");


--
-- Name: Test Test_SaseNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Test"
    ADD CONSTRAINT "Test_SaseNo_fkey" FOREIGN KEY ("SaseNo") REFERENCES public."YapılanAraclar"("SaseNo");


--
-- Name: YapılanAraclar YapılanAraclar_AracId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YapılanAraclar"
    ADD CONSTRAINT "YapılanAraclar_AracId_fkey" FOREIGN KEY ("AracId") REFERENCES public."AraçKataloğu"("AraçId");


--
-- Name: YapılanAraclar YapılanAraclar_AracTürId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YapılanAraclar"
    ADD CONSTRAINT "YapılanAraclar_AracTürId_fkey" FOREIGN KEY ("AracTürId") REFERENCES public."AraçTürü"("AraçTürId");


--
-- Name: YapılanAraclar YapılanAraclar_Personeld_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YapılanAraclar"
    ADD CONSTRAINT "YapılanAraclar_Personeld_fkey" FOREIGN KEY ("Personeld") REFERENCES public."PersonelBilgileri"("PersonelId");


--
-- PostgreSQL database dump complete
--

