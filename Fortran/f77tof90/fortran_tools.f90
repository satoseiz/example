!CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
!C \file      FORTRAN77.F
!C \author    SENOO, Ken
!C \copyright CC0
!C \version   0.0.0
!C \date      Created: 2019-08-28 Wed
!C \date      Updated: 2019-08-29 Thu
!C \sa        https://senooken.jp/blog/2014/08/08/
!CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      CHARACTER STR*100

      PRINT *, "CONVERSION EXAMPLE FOR FORTRAN 77 TO Fortran 90."
      PRINT *, "FORTRAN 77����Fortran 90�ւ̕ϊ���"

      PRINT *, "�@�������� (CP932) �`�F�b�N"

      PRINT *, "LINE CONTINUATION, �p���s�̃e�X�g"
      PRINT *, "1�s72�o�C�g�B�����ɒ��ӁB"
      PRINT *, "�s�p����6���ڂ�0�Ƌ󔒈ȊO��z�u�B"

      STR = "01234567890123456789012345678901234567890123456789"&
     &   // "01234567890123456789012345678901234567890123456789"
      PRINT *, STR

      DO 10 I=1, 4
        IF (I .EQ. I/2*2 .and. I .LT. 3) THEN
          PRINT *, I
        END IF
10    CONTINUE
      END
