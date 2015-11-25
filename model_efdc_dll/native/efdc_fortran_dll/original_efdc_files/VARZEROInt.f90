      SUBROUTINE VARZEROInt
! ***
! *** THIS SUBROUTINE ZERO'S ALL OF THE ARRAYS AFTER ALLOCATION
! ***

      USE GLOBAL  
!  
      WRITE(*,'(A)')'ZEROING Integer ARRAYS'  
!
! *** INTEGER ARRAYS
!
      ISADAC=0
      ISADAH=0
      ISADAV=0
      ISCDA=0
      ISCDCA=0
      ISCI=0
      ISCO=0
      ISFCT=0
      ISHPLTV=0
      ISPHXY=0
      ISPLIT=0
      ISRSPH=0
      ISRSPV=0
      ISSPH=0
      ISSPV=0
      ISTOPT=0
      ISTRAN=0
      ISTRWQ=0
      JSRSPH=0
      JSRSPV=0
      JSSPH=0
      JSSPV=0
      LWQTS=0
      NCSPH=0
      NCSPV=0
      NIJSPV=0
      NIJVPV=0
      NPSPH=0
      NPSPV=0
      NWQCSR=0
!
      IACTLR=0
      IAIJ=0
      IAKL=0
      IAP=0
      IBENMAP=0
      IBLTAUC=0
      ICALJP=0
      ICBE=0
      ICBN=0
      ICBS=0
      ICBW=0
      ICDA=0
      ICFLMP=0
      ICPSL=0
      ICSMTS=0
      ICWQTS=0
      IDRICM=0
      IJCT=0
      IJCTLT=0
      IL=0
      ILLSHA=0
      ILLT=0
      ILRPD=0
      ILTMSR=0
      IMASKDRY=0
      IMDCHH=0
      IMDCHU=0
      IMDCHV=0
      IMWQZT=0
      IMWQZT1=0
      INPNS=0
      IOUTJP=0
      IPBE=0
      IPBN=0
      IPBS=0
      IPBW=0
      IQCAX=0
      IQCTLD=0
      IQCTLU=0
      IQJP=0
      IQS=0
      IQWRD=0
      IQWRU=0
      IRELH=0
      IROUSE=0
      ISBDLD=0
      ISCDRY=0
      ISDBLDIR=0
      ISDIFBW=0
      ISDJP=0
      ISEDBU=0
      ISEDSCOR=0
      ISEDWU=0
      ISENT=0
      ISLTAUC=0
!      ISLUSED=0
      ISMHYPD=0
      ISMT=0
      ISMZMAP=0
      ISNDBU=0
      ISNDEQ=0
      ISNDM1=0
      ISNDM2=0
      ISNDWU=0
      ISPBE=0
      ISPBN=0
      ISPBS=0
      ISPBW=0
      ISPNS=0
      ISPV=0
      !ISRED=0     ! PMC - NOT USED
      ISS3DSED=0
      ISS3DSND=0
      ISS3DTOX=0
      ISTJP=0
      ISTOC=0
      ISTOXR=0
      ISUDPC=0
      ISWDINT=0
      ITOXBU=0
      ITOXWU=0
      ITXBDUT=0
      ITXINT=0
      ITXPARB=0
      ITXPARBC=0
      ITXPARW=0
      ITXPARWC=0
      IUBE=0
      IUBW=0
      IUPCJP=0
      IVBN=0
      IVBS=0
      IVPV=0
      IVSFP=0
      IWGG=0
      IWQCBE=0
      IWQCBN=0
      IWQCBS=0
      IWQCBW=0
      IWQKA=0
      IWQOBE=0
      IWQOBN=0
      IWQOBS=0
      IWQOBW=0
      IWQPSC=0
      IWQPSV=0
      IWQT=0
      IWQZMAP=0
      IWRSP=0
      IWRSPB=0
      JCBE=0
      JCBN=0
      JCBS=0
      JCBW=0
      JCDA=0
      JCPSL=0
      JL=0
      JLLSHA=0
      JLLT=0
      JLRPD=0
      JLTMSR=0
      JMDCHH=0
      JMDCHU=0
      JMDCHV=0
      JNPNS=0
      JPBE=0
      JPBN=0
      JPBS=0
      JPBW=0
      JQCAX=0
      JQCTLD=0
      JQCTLU=0
      JQJP=0
      JQS=0
      JQWRD=0
      JQWRU=0
      JSPNS=0
      JSPV=0
      JSS3DSED=0
      JSS3DSND=0
      JSS3DTOX=0
      JUBE=0
      JUBW=0
      JUNTPX=0
      JUNTPY=0
      JUPCJP=0
      JVBN=0
      JVBS=0
      JVPV=0
      JVSFP=0
      JWGG=0
      JWQCBE=0
      JWQCBN=0
      JWQCBS=0
      JWQCBW=0
      KBT=0
      KCEFDC=0
      KCPSL=0
      KEFFJP=0
      KFEFDC=0
      KPB=0
      KPS=0
      KQJP=0
      KQWRD=0
      KQWRU=0
      KUPCJP=0
      KUPW=0
      KWBU=0
      KWBV=0
      KWU=0
      KWV=0
      KWW=0
      !LBC=0     ! PMC - NOT USED
      LBERC=0
      LBNRC=0
      LBSRC=0
      LBWRC=0
      LCBE=0
      LCBN=0
      LCBS=0
      LCBW=0
      LCDA=0
      LCEFDC=0
      LCHNC=0
      LCONSOL=0
      LCT=0
      LCTLT=0
      LFEFDC=0
      LIJ=0
      LIJLT=0
      LJUNX=0
      LJUNY=0
      LLBC=0
      LLRC=0
      LLSHA=0
      LMDCHH=0
      LMDCHU=0
      LMDCHV=0
      LNC=0
      LNCLT=0
      LNEC=0
      LNWC=0
      LOBCS=0
      LBCS=0
      LORDER=0
      LPBE=0
      LPBN=0
      LPBS=0
      LPBW=0
      LQCTLD=0
      LQCTLU=0
      LQS=0
      LQWRD=0
      LQWRU=0
      !LRC=0      ! PMC - NOT USED
      !LREBC=0    ! PMC - NOT USED
      !LRNBC=0    ! PMC - NOT USED
      !LRSBC=0    ! PMC - NOT USED
      !LRWBC=0    ! PMC - NOT USED
      LSBLBCD=0
      LSBLBCU=0
      LSC=0
      LSCLT=0
      LSEC=0
      LSHAB=0
      LSHAP=0
      LSHAU=0
      LSHAUE=0
      LSMTS=0
      LSWC=0
      LUBE=0
      LUBW=0
      LUPU=0
      LUPV=0
      LUU=0
      LUV=0
      LUW=0
      LUWV=0
      LUWW=0
      LVBN=0
      LVBS=0
      LVSU=0
      LVSW=0
      !LVU=0    ! PMC - NOT USED
      !LVV=0    ! PMC - NOT USED
      !LVW=0    ! PMC - NOT USED
      LWGG=0
      MASER=0
      MATLAST=0
      MCNTLR=0
      MCSER=0
      MCTLAST=0
      MDCHTYP=0
      MGWSER=0
      MGWTLAST=0
      MPSER=0
      MPTLAST=0
      MQCTL=0
      MQSER=0
      MQTLAST=0
      MQWRSR=0
      MQWRTLST=0
      MSVSED=0
      MSVSND=0
      MSVTOX=0
      MTMSRA=0
      MTMSRC=0
      MTMSRP=0
      MTMSRQ=0
      MTMSRQE=0
      MTMSRU=0
      MTMSRUE=0
      MTMSRUT=0
      MTSCUR=0
      MTSSTSP=0
      MVEGL=0
      MVEGSER=0
      MVEGTLAST=0
      MVPSL=0
      !MWQCSR=0
      MWQCTLT=0
      MWQPSR=0
      MWQPTLT=0
      MWSER=0
      MWTLAST=0
      NATDRY=0
      NCHNC=0
      NCSER=0
      NCSERA=0
      NCSERE=0
      NCSERJP=0
      NCSERN=0
      NCSERQ=0
      NCSERS=0
      NCSERW=0
      NDWHT=0
	  NGWSL=0
      NJEL=0
      NJPMX=0
      NLOE=0
      NLON=0
      NLOS=0
      NLOW=0
      NLRPDL=0
      NLRPDRT=0
      NPORTJP=0
      NPSERE=0
      NPSERN=0
      NPSERS=0
      NPSERW=0
      NQCMFD=0
      NQCMFU=0
      NQCMUL=0
      NQCTLQ=0
      NQCTYP=0
      NQSERJP=0
      NQSERQ=0
      NQSMF=0
      NQSMUL=0
      NQWRMFD=0
      NQWRMFU=0
      NQWRSERJP=0
      NQWRSERQ=0
      NSP2=0
      NTSCRE=0
      NTSCRN=0
      NTSCRS=0
      NTSCRW=0
      NTSSSS=0
      NTVSFP=0
      NUDJP=0
      NUDJPC=0
      NUMTMP=0
      NUTMP=0
      NVEGSERV=0
      !NWQLOE=0  ! PMC - NOT USED
      !NWQLON=0  ! PMC - NOT USED
      !NWQLOS=0  ! PMC - NOT USED
      !NWQLOW=0  ! PMC - NOT USED
      NXYSDAT=0
      NZPRJP=0
      SLLN=3
  !ENSIGHT VARIABLES ZEROS
      VARUNCOUNT=0
      ENSIGHT1=0
      ENSIGHT2=0
      ENSIGHT3=0
      ENSIGHT4=0
      ENSIGHT5=0
      ENSIGHT6=0
      ENSIGHT7=0
      ENSIGHT8=0
      ENSIGHT9=0
      ENSIGHT10=0
      ENSIGHT11=0
      ENSIGHT12=0
      ENSIGHT13=0
      ENSIGHT14=0
      ENSIGHT15=0
      ENSIGHT16=0
      ENSIGHT17=0
      ENSIGHT18=0
      ENSIGHT19=0
      ENSIGHT20=0
      ENSIGHT21=0
      ENSIGHT22=0
      ENSIGHT23=0
      ENSIGHT24=0
      ENSIGHT25=0
      ENSIGHT26=0
      ENSIGHT27=0
      ENSIGHT28=0
      ENSIGHT29=0
      ENSIGHT30=0
      ENSIGHT31=0
! { GEOSR GATE : JGCHO
      NGATE=0
      NGATEC=0
      NGTYP=0
      NCG3FOM=0
      NICMP=0
      NOCMP=0
      ICMPI=0
      JCMPI=0
      ICMPO=0
      JCMPO=0
      NGCHECK=0
      NGCCHECK=0
      NGCOUNT=0
      LGTMSKE=0
      LGTMSKF=0
      MTIDELAST=0  ! GEOSR ESTURAY TIDE : JGCHO
      MGTLAST=0  ! GEOSR JGCHO 2011.10.27
      IAG=0 ! GEOSR JGCHO 2011.10.27
      IAGUSER=0 ! GEOSR JGCHO 2011.10.27
! } GEOSR GATE : JGCHO
! 
!{GeoSR, 2014.07.04 YSSONG, WIND DRAG COEFF.
      ISWIND=0
      ISCD=0
!} GeoSR, 2014.07.04 YSSONG, WIND DRAG COEFF.
      ISICE=0  !{GeoSR, 2015.01.15 JHLEE, NEGATIVE WATER TEMPERATURE PROBLEM

      END
