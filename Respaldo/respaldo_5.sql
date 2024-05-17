PGDMP                      |            Clinica    16.2    16.2 =    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16397    Clinica    DATABASE     |   CREATE DATABASE "Clinica" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "Clinica";
                postgres    false            �            1259    16699    Cama    TABLE     d   CREATE TABLE public."Cama" (
    cama_id integer NOT NULL,
    fk_habitacion_id integer NOT NULL
);
    DROP TABLE public."Cama";
       public         heap    postgres    false            �            1259    16704    Comuna    TABLE     o   CREATE TABLE public."Comuna" (
    comuna_id integer NOT NULL,
    nombre_comuna character varying NOT NULL
);
    DROP TABLE public."Comuna";
       public         heap    postgres    false            �            1259    16821    Comuna_comuna_id_seq    SEQUENCE     �   ALTER TABLE public."Comuna" ALTER COLUMN comuna_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Comuna_comuna_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16711    Diagnostico    TABLE     q   CREATE TABLE public."Diagnostico" (
    idagnostico_id integer NOT NULL,
    fecha date,
    descripcion text
);
 !   DROP TABLE public."Diagnostico";
       public         heap    postgres    false            �            1259    16725    Especialidad    TABLE     �   CREATE TABLE public."Especialidad" (
    especialidad_id integer NOT NULL,
    nombre_especialidad character varying NOT NULL
);
 "   DROP TABLE public."Especialidad";
       public         heap    postgres    false            �            1259    16822     Especialidad_especialidad_id_seq    SEQUENCE     �   ALTER TABLE public."Especialidad" ALTER COLUMN especialidad_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Especialidad_especialidad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16732    Examen    TABLE     �   CREATE TABLE public."Examen" (
    examen_id integer NOT NULL,
    fecha date NOT NULL,
    resultados text NOT NULL,
    fk_paciente_id integer NOT NULL,
    fk_diagnostico integer
);
    DROP TABLE public."Examen";
       public         heap    postgres    false            �            1259    16823    Examen_examen_id_seq    SEQUENCE     �   ALTER TABLE public."Examen" ALTER COLUMN examen_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Examen_examen_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16739 
   Habitacion    TABLE     f   CREATE TABLE public."Habitacion" (
    habitacion_id integer NOT NULL,
    numero integer NOT NULL
);
     DROP TABLE public."Habitacion";
       public         heap    postgres    false            �            1259    16829    Habitacion_habitacion_id_seq    SEQUENCE     �   ALTER TABLE public."Habitacion" ALTER COLUMN habitacion_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Habitacion_habitacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 699
    CACHE 1
);
            public          postgres    false    220            �            1259    16744    Medico    TABLE     �  CREATE TABLE public."Medico" (
    medico_id integer NOT NULL,
    primer_nombre character varying NOT NULL,
    apellido_paterno character varying NOT NULL,
    apellido_materno character varying,
    segundo_nombre character varying,
    rut integer NOT NULL,
    sexo boolean NOT NULL,
    fecha_nacimiento date NOT NULL,
    telefono integer NOT NULL,
    mail character varying NOT NULL,
    fk_especialidad_id integer NOT NULL
);
    DROP TABLE public."Medico";
       public         heap    postgres    false            �            1259    16825    Medico_medico_id_seq    SEQUENCE     �   ALTER TABLE public."Medico" ALTER COLUMN medico_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Medico_medico_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16751    Paciente    TABLE       CREATE TABLE public."Paciente" (
    paciente_id integer NOT NULL,
    primer_nombre character varying NOT NULL,
    segundo_nombre character varying,
    apellido_paterno character varying NOT NULL,
    apellido_materno character varying,
    sexo boolean NOT NULL,
    fecha_nacimiento date NOT NULL,
    hospitalizado boolean NOT NULL,
    rut integer NOT NULL,
    telefono integer NOT NULL,
    mail character varying NOT NULL,
    calle character varying NOT NULL,
    numero_casa character varying,
    fecha_ingreso date NOT NULL,
    fecha_alta date NOT NULL,
    fk_comuna_id integer NOT NULL,
    fk_habitacion_id integer NOT NULL,
    fk_medico_id integer NOT NULL,
    "fk_Region_id" integer NOT NULL,
    fk_id_prevision integer NOT NULL,
    fk_id_diagnostico integer
);
    DROP TABLE public."Paciente";
       public         heap    postgres    false            �            1259    16824    Paciente_paciente_id_seq    SEQUENCE     �   ALTER TABLE public."Paciente" ALTER COLUMN paciente_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Paciente_paciente_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16758 	   Prevision    TABLE     x   CREATE TABLE public."Prevision" (
    id_prevision integer NOT NULL,
    nombre_prevision character varying NOT NULL
);
    DROP TABLE public."Prevision";
       public         heap    postgres    false            �            1259    16827    Prevision_id_prevision_seq    SEQUENCE     �   ALTER TABLE public."Prevision" ALTER COLUMN id_prevision ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Prevision_id_prevision_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16765    Region    TABLE     f   CREATE TABLE public."Region" (
    region_id integer NOT NULL,
    nombre_region character varying
);
    DROP TABLE public."Region";
       public         heap    postgres    false            �            1259    16826    Region_id_seq    SEQUENCE     �   ALTER TABLE public."Region" ALTER COLUMN region_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Region_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            )          0    16699    Cama 
   TABLE DATA           ;   COPY public."Cama" (cama_id, fk_habitacion_id) FROM stdin;
    public          postgres    false    215   �M       *          0    16704    Comuna 
   TABLE DATA           <   COPY public."Comuna" (comuna_id, nombre_comuna) FROM stdin;
    public          postgres    false    216   N       +          0    16711    Diagnostico 
   TABLE DATA           K   COPY public."Diagnostico" (idagnostico_id, fecha, descripcion) FROM stdin;
    public          postgres    false    217   �N       ,          0    16725    Especialidad 
   TABLE DATA           N   COPY public."Especialidad" (especialidad_id, nombre_especialidad) FROM stdin;
    public          postgres    false    218   �O       -          0    16732    Examen 
   TABLE DATA           `   COPY public."Examen" (examen_id, fecha, resultados, fk_paciente_id, fk_diagnostico) FROM stdin;
    public          postgres    false    219   P       .          0    16739 
   Habitacion 
   TABLE DATA           =   COPY public."Habitacion" (habitacion_id, numero) FROM stdin;
    public          postgres    false    220   �Q       /          0    16744    Medico 
   TABLE DATA           �   COPY public."Medico" (medico_id, primer_nombre, apellido_paterno, apellido_materno, segundo_nombre, rut, sexo, fecha_nacimiento, telefono, mail, fk_especialidad_id) FROM stdin;
    public          postgres    false    221   �Q       0          0    16751    Paciente 
   TABLE DATA           A  COPY public."Paciente" (paciente_id, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, sexo, fecha_nacimiento, hospitalizado, rut, telefono, mail, calle, numero_casa, fecha_ingreso, fecha_alta, fk_comuna_id, fk_habitacion_id, fk_medico_id, "fk_Region_id", fk_id_prevision, fk_id_diagnostico) FROM stdin;
    public          postgres    false    222   �S       1          0    16758 	   Prevision 
   TABLE DATA           E   COPY public."Prevision" (id_prevision, nombre_prevision) FROM stdin;
    public          postgres    false    223   �V       2          0    16765    Region 
   TABLE DATA           <   COPY public."Region" (region_id, nombre_region) FROM stdin;
    public          postgres    false    224   DW       A           0    0    Comuna_comuna_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Comuna_comuna_id_seq"', 10, true);
          public          postgres    false    225            B           0    0     Especialidad_especialidad_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Especialidad_especialidad_id_seq"', 10, true);
          public          postgres    false    226            C           0    0    Examen_examen_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Examen_examen_id_seq"', 31, true);
          public          postgres    false    227            D           0    0    Habitacion_habitacion_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Habitacion_habitacion_id_seq"', 1, true);
          public          postgres    false    232            E           0    0    Medico_medico_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Medico_medico_id_seq"', 10, true);
          public          postgres    false    229            F           0    0    Paciente_paciente_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Paciente_paciente_id_seq"', 96, true);
          public          postgres    false    228            G           0    0    Prevision_id_prevision_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Prevision_id_prevision_seq"', 10, true);
          public          postgres    false    231            H           0    0    Region_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Region_id_seq"', 16, true);
          public          postgres    false    230            |           2606    16703    Cama Cama_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."Cama"
    ADD CONSTRAINT "Cama_pkey" PRIMARY KEY (cama_id);
 <   ALTER TABLE ONLY public."Cama" DROP CONSTRAINT "Cama_pkey";
       public            postgres    false    215            ~           2606    16710    Comuna Comuna_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Comuna"
    ADD CONSTRAINT "Comuna_pkey" PRIMARY KEY (comuna_id);
 @   ALTER TABLE ONLY public."Comuna" DROP CONSTRAINT "Comuna_pkey";
       public            postgres    false    216            �           2606    16717    Diagnostico Diagnostico_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Diagnostico"
    ADD CONSTRAINT "Diagnostico_pkey" PRIMARY KEY (idagnostico_id);
 J   ALTER TABLE ONLY public."Diagnostico" DROP CONSTRAINT "Diagnostico_pkey";
       public            postgres    false    217            �           2606    16731    Especialidad Especialidad_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."Especialidad"
    ADD CONSTRAINT "Especialidad_pkey" PRIMARY KEY (especialidad_id);
 L   ALTER TABLE ONLY public."Especialidad" DROP CONSTRAINT "Especialidad_pkey";
       public            postgres    false    218            �           2606    16738    Examen Examen_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Examen"
    ADD CONSTRAINT "Examen_pkey" PRIMARY KEY (examen_id);
 @   ALTER TABLE ONLY public."Examen" DROP CONSTRAINT "Examen_pkey";
       public            postgres    false    219            �           2606    16743    Habitacion Habitacion_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Habitacion"
    ADD CONSTRAINT "Habitacion_pkey" PRIMARY KEY (habitacion_id);
 H   ALTER TABLE ONLY public."Habitacion" DROP CONSTRAINT "Habitacion_pkey";
       public            postgres    false    220            �           2606    16750    Medico Medico_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Medico"
    ADD CONSTRAINT "Medico_pkey" PRIMARY KEY (medico_id);
 @   ALTER TABLE ONLY public."Medico" DROP CONSTRAINT "Medico_pkey";
       public            postgres    false    221            �           2606    16757    Paciente Paciente_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (paciente_id);
 D   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_pkey";
       public            postgres    false    222            �           2606    16764    Prevision Prevision_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Prevision"
    ADD CONSTRAINT "Prevision_pkey" PRIMARY KEY (id_prevision);
 F   ALTER TABLE ONLY public."Prevision" DROP CONSTRAINT "Prevision_pkey";
       public            postgres    false    223            �           2606    16769    Region Region_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY (region_id);
 @   ALTER TABLE ONLY public."Region" DROP CONSTRAINT "Region_pkey";
       public            postgres    false    224            �           2606    16780    Cama Cama_fk_habitacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cama"
    ADD CONSTRAINT "Cama_fk_habitacion_id_fkey" FOREIGN KEY (fk_habitacion_id) REFERENCES public."Habitacion"(habitacion_id);
 M   ALTER TABLE ONLY public."Cama" DROP CONSTRAINT "Cama_fk_habitacion_id_fkey";
       public          postgres    false    215    4742    220            �           2606    16790 +   Diagnostico Diagnostico_idagnostico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diagnostico"
    ADD CONSTRAINT "Diagnostico_idagnostico_id_fkey" FOREIGN KEY (idagnostico_id) REFERENCES public."Examen"(examen_id);
 Y   ALTER TABLE ONLY public."Diagnostico" DROP CONSTRAINT "Diagnostico_idagnostico_id_fkey";
       public          postgres    false    217    4740    219            �           2606    24625 $   Examen Examen_fk_diagnostico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Examen"
    ADD CONSTRAINT "Examen_fk_diagnostico_id_fkey" FOREIGN KEY (fk_diagnostico) REFERENCES public."Diagnostico"(idagnostico_id) NOT VALID;
 R   ALTER TABLE ONLY public."Examen" DROP CONSTRAINT "Examen_fk_diagnostico_id_fkey";
       public          postgres    false    4736    219    217            �           2606    16785 !   Examen Examen_fk_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Examen"
    ADD CONSTRAINT "Examen_fk_paciente_id_fkey" FOREIGN KEY (fk_paciente_id) REFERENCES public."Paciente"(paciente_id);
 O   ALTER TABLE ONLY public."Examen" DROP CONSTRAINT "Examen_fk_paciente_id_fkey";
       public          postgres    false    219    222    4746            �           2606    16815 %   Medico Medico_fk_especialidad_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Medico"
    ADD CONSTRAINT "Medico_fk_especialidad_id_fkey" FOREIGN KEY (fk_especialidad_id) REFERENCES public."Especialidad"(especialidad_id);
 S   ALTER TABLE ONLY public."Medico" DROP CONSTRAINT "Medico_fk_especialidad_id_fkey";
       public          postgres    false    4738    221    218            �           2606    16805 #   Paciente Paciente_fk_Region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_Region_id_fkey" FOREIGN KEY ("fk_Region_id") REFERENCES public."Region"(region_id);
 Q   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_Region_id_fkey";
       public          postgres    false    224    222    4750            �           2606    16770 #   Paciente Paciente_fk_comuna_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_comuna_id_fkey" FOREIGN KEY (fk_comuna_id) REFERENCES public."Comuna"(comuna_id);
 Q   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_comuna_id_fkey";
       public          postgres    false    222    216    4734            �           2606    24620 (   Paciente Paciente_fk_diagnostico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_diagnostico_id_fkey" FOREIGN KEY (fk_id_diagnostico) REFERENCES public."Diagnostico"(idagnostico_id) NOT VALID;
 V   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_diagnostico_id_fkey";
       public          postgres    false    4736    222    217            �           2606    16775 '   Paciente Paciente_fk_habitacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_habitacion_id_fkey" FOREIGN KEY (fk_habitacion_id) REFERENCES public."Habitacion"(habitacion_id);
 U   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_habitacion_id_fkey";
       public          postgres    false    4742    222    220            �           2606    16810 &   Paciente Paciente_fk_id_prevision_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_id_prevision_fkey" FOREIGN KEY (fk_id_prevision) REFERENCES public."Prevision"(id_prevision);
 T   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_id_prevision_fkey";
       public          postgres    false    4748    222    223            �           2606    16800 #   Paciente Paciente_fk_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_fk_medico_id_fkey" FOREIGN KEY (fk_medico_id) REFERENCES public."Medico"(medico_id);
 Q   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_fk_medico_id_fkey";
       public          postgres    false    222    221    4744            )   0   x��� D���b<		z��0c2�9��Y�&����6��,N      *   z   x��=
�@�z�S�b���,���E������ǰLk;3�^M7�/�aE��Qbʭ0�t�:Y�i�fFuM�[�w��;j�-�=����2�zV�%2�s�ο��J�gI���R)'      +   �   x�E�=N1�k�)|� �l��2"P�4��H�^�$�C�2JG�1��H�}z�{�h��r��� <�9��8�Ѹ&�D*����;}��̚�U*��-Ng�'�Do�h����jtf%U�r�B��k歺o�{pfM��_s��Y o�@���+�%�Q�w��d�R�1q���0�>M���ķ�����T	ơNE���D����/<_���\�      ,   s   x�3�tN,J����O?�6�ˈ�%�(7��7�tO,.)�O�+I-�	�p����y���i%�9�0�g@jJfbI�c�P�YX
�Zp�%�"�o�
7�Ѐ�5/%?�(3&���� �Y=�      -   �  x�EQ�j�0>��B�{�޵��PrH	��ˬ<q�Ȓ#�}�>@����x7u@I|��	���]����ę��ۋ�%oOvL23t'@4ؼ�4wu�����BC��J#��`)NB��1x�k�_O�E���0��0D;��(e�9Z��<l�gq3z�gʓ��S��J(�Ő%�v�
!�+���q7�<�gO��&�-��Z/�
d����H��<<���
��B���ף�[������	z��d�����#%�M�-�2�t�>Ǭb��)�u���X���`�����W��������A_oE޸!!�)H�^��MS�5*ս׼)��3�8&-ž.l��sQ�H6�I��i�-4�i�ݕV��~ƭ��qþ�G�蓺�[
�C��6?>c�`�q      .   7   x���  �7[s$��ׁ?��B;�v��b�Mڤlq��ڋ�I�������
�      /   �  x�U�=r�0��ǻ C�G$�8v���8�'U�g�R�@��m\�P��x�<HU@��+�aDO��v'�7�4�)�ݢUƁ��\U5 �:e銉��Z�E�	�Eb~�H��G�xkzIk��a3���'��?:�8|�h;�6Ks�e��j�G+�;\���,���Z�hۙO��E�Fo�tv�b�*�,O#ÇY�����NΓ�φ(��H�ϝ��~K��@��diŲ4r��%���q%<����XT���TG�����@�f��n��+���K�(VsE}��;�=:�#�'x�*B`��j�e\FV�Eʏ�4�������z�~�<7�!P��d���Z��������T���()eK%K�"t�7A�
�Ŗ��i��׳h���+җh�F��J��|�w�����E����8*ccvs��������>���w�mW,-�("���h�m�ƙ��I��[�      0   �  x�]�Mn�0�ףS�DJ��]]篅]�I�U7�vXФKJY�6Yf�E�#�bJ�~�Ќ?�yOy[��;���B�C��'���߉n{`E��8	9����b����Vb�m�tD���a����8t@��yꇰl(yl�xШ;��Vzg�77hKOF�U�	�"�e2&1=�1�r��	gp��uJ��wq'�q��; �eCIX�4��+�gi��j"�V�B�^�<�?�z6Q5F�z�oi�	�x���K6&
�Z:X�Ga+[cQ	R=c�I�q��*�)�DE�ѱk�k���
?�ޜ��\&���Ւ,����Qh�!�p?�h×�R/H2�I&��ms��v�٢~Am<���x([�$g�eP$��N���5og�n���}�1B�V�N4�]w���i�x�FI:ָ�d�y�C�����A��%j)µ�HWNM{_�>Fdr�M�M��u#"�S%��6uKk*��4L���Oe��������5�te�4�IvJ��Zꊜي���r��=�D��He;!�]�l_kyj3:扏8��Y�H'��bf�t���]%�2�����Y�GJ=Wܩ2QǙ=}dʾm���g����~9�����<a����ԭ�V��ɾ1��yU�W&�D-���b"��ut�|��J	[�9�`�tvw�<�A���t�      1   �   x�5�=
1���S���o��B+��\�Ϛ���kx
O�3 [|3�b��gT#��c�;xN::o�>:c��)��p�lxI:嗪B��mu����ZB]���A�&��w�5�A?�3�;�\MG>���|�0�T55�      2     x�=�=N�0��S���PfS RV @T4/Y,y=�v���
��))Rp߄���b�yz3�=��JoZ����7�D����ѣM#ϩtQ^�!dgAeD�xI��f�����i
����K/�D8��V�pѠ���4�Glūk���Uk��V�������:�_���\�S���T��H�&�bF5T�1�pis�%��l.GQg`K*�!���Þ���+�Mӯ�8zv}~������[��mF��FEUo�j~9c�d n     