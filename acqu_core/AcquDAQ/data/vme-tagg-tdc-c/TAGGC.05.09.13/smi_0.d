************************************************************************
*			  Kelvin Laboratory
*			University of Glasgow
*			*******smi_0.d*******
*
*	Almost standard LeCroy 1821 SMI code
*	Bug fix of P.Jennewein installed line db
*
***********************************************************************
*
*	SMI code file conventions:
*	smi_0.d: almost standard LeCroy supplied code
*	smi_1.d: fast readout loop, random software read
*	smi_2.d: fast readout loop, block software read
*	smi_3.d: fast readout loop, random hardware read
*	smi_4.d: fast readout loop, block hardware read
*	smi_5.d: basic JRMA mods of LeCroy..expts till Apr 1993
*
*	All non-comment lines should have 9 fields
*	0: line number..must increase monotonically
*	1: instruction code
*	2: condition code
*	3: bus control code
*	4: hs bus data
*	5: strobe code
*	6: data flow control
*	7: fastbus protocol 1
*	8: fastbus protocol 2
*
***********************************************************************
*
*	Sequencer Idle Loop
*
* 0  1  2  3  4  5  6  7  8	Field alignment
  0  8 42  4  0  0  0  2  0
  1  a 42  4  1  0  0  2  0
  2  0  0  4  0  0  0  0  0
  3  0  0  0  0  0  0  0  0
  4  0  0  0  0  0  0  0  0
  5  0  0  0  0  0  0  0  0
  6  0  0  0  0  0  0  0  0
  7  0  0  0  0  0  0  0  0
  8  8  0  0  0  8  0  0  0
  9  8  0  4  0  0  0  2 3f
  a  d  0  4 eb  0  0  0  0
  b  c  0  4  0  8  0  0  0
  c  8  0  0  0  8  0  0  0
  d  8  0  4  0  0  0  2 3f
  e  d  0  4 eb  0  0  6  1
  f  c  0  4  0  8  0  0  0
 10  8  0  4 32  2  0  2 1f
 11  d  0  4 e2  0  0  0  0
 12  c  0  4  0  0  4  0  0
 13  8  0  4 28  2  0  2 1f
 14  d  0  4 e2  0  0  6  2
 15  c  0  4  0  0  4  0  0
 16  8  0  4 32  2  0  2 1f
 17  d  0  4 d9  0  0  0  0
 18  c  0  4  0  0  0  0  0
 19  8  0  4 28  2  0  2 1f
 1a  d  0  4 d9  0  0  6  2
 1b  c  0  4  0  0  0  0  0
 1c  d  0  4 fb  0  0  0  0
 1d  c  0  4  0  0  4  3 20
 1e  8  0  4  0  0  0  2 3f
 1f  d  0  4 f2  4  0  6  2
 20  c  0  4  0  0  0  0  0
 21  8  0  4  0  0  0  2 3f
 22  d  0  4 f2  4  0  6  3
 23  c  0  4  0  0  0  0  0
 24  c  0  4 5b  4  0  7 20
 25  c  0  4 50  0  0  0  0
 26  c  0  4 aa  0  0  0  0
 27  c  0  4 56  0  0  0  0
 28  c  0  4 59  0  0  0  0
 29  c  0  4 9f  0  0  0  0
 2a  c  0  4 99  0  0  0  0
 2b  c  0  4  0  0  0  3 20
 2c  d  0  4 7a  0  0  2 1f
 2d  c  0  4  0  0  0  0  0
 2e  d  0  4 bc  0  0  2 10
 2f  c  0  4  0  0  0  0  0
 30  c  0  4 d3  0  0  0  0
 31  c  0  4 d6  0  0  0  0
 32  c  0  4 5e  0  0  0  0
 33  c  0  4 89  0  0  0  0
 34  c  0  4  0  0  0  6 20
 35  c  0  4  0  0  0  2 20
 36  c  0  4  0  0  0  6 10
 37  c  0  4  0  0  0  2 10
 38  c  0  4  0  0  0  7  1
 39  c  0  4  0  0  0  3  1
 3a  c  0  4  0  0  0  6  8
 3b  c  0  4  0  0  0  2  8
 3c  c  0  4  0  0  0  7 20
 3d  c  0  4  0  0  0  3 20
 3e  0  0  0  0  0  0  0  0
 3f  0  0  0  0  0  0  0  0
 40  8  0  4  c  8  0  2 3f
 41  d  0  4 eb  0  0  6  1
 42  d  0  4 f7  0  0  3  4
 43  8  0  4 80  1  0  0  0
 44  d  0  4 d9  0  0  2 17
 45  d  0  4 fb  0  0  3  4
 46  8  0  4  c  8  0  2 3f
 47  d  0  4 eb  0  0  0  0
 48  d  0  4 7a  0  0  2 1f
 49  d  0  4 fb  0  0  0  0
 4a  c  0  4 40  0  0  0  0
 4b  0  0  0  0  0  0  0  0
 4c  0  0  0  0  0  0  0  0
 4d  0  0  0  0  0  0  0  0
 4e  0  0  0  0  0  0  0  0
 4f  0  0  0  0  0  0  0  0
 50  d  0  4 fb  0  0  3  4
 51  8  0  0  0  c  0  7 20
 52  8 47  7  0  0  0  e 23
 53  a 47  7 53  0  0  8  0
 54  d  0  4 e2  0  0  2 1f
 55  c  0  5  0  8  c  2  0
 56  8  0  c  0  2  0  0  0
 57  8  0  4  0  0  0  0  0
 58  c  0  4  0  0  0  0  0
 59  8  0  0  0  0  0  5 80
 5a  c  0  4  0  0  0  0  0
 5b  8 46  4  0  0  0  5 20
 5c  a 46  4 5c  0  0  0  0
 5d  c  0  4 1c  0  0  0  0
 5e  8  0  4  0  2  0  0  0
 5f  d  0  4 e2  0  0  2 1f
 60  a 22  4 66  0  0  2  0
 61  8  0  9  0  8  2  0  0
 62  8  0  7  0  0  0  0  0
 63  8 4b  7  0  0  0  0  0
 64  a  0  4 5f  0  0  0  0
 65  c  0  4 5f  0  4  0  0
 66  a  0  4  0  0  0  0  0
 67  8  0  4  1  2  0  0  0
 68  c  0  4  0  0  0  0  0
 69  8 21  7  1  8  0  2  0
 6a  a  0  4 78  0  0  2  0
 6b  8 22  4  0 18  0  2  0
 6c  a  0  4 78  0  0  2  0
 6d  8 23  4  0 18  0  2  0
 6e  a  0  4 78  0  0  2  0
 6f  8 24  4  0 18  0  2  0
 70  a  0  4 78  0  0  2  0
 71  8 25  4  0 18  0  2  0
 72  a  0  4 78  0  0  2  0
 73  8 26  4  0 18  0  2  0
 74  a  0  4 78  0  0  2  0
 75  8 27  4  0 18  0  2  0
 76  a  0  4 78  0  0  2  0
 77  8  0  4  0 18  0  2  0
 78  8  0  c  0  2  0  2 1f
 79  4  0  4  0  0  0  0  0
 7a  8 19  4  0  2  8  6  8
 7b  a 19  4 7b  0  8  3  4
 7c  8  0  4  0  0  8  7  4
 7d  8 6f  4  0  0  8  2  0
 7e  a 6f  4 7e  0  8  2  0
 7f  8  0  4  0  0  0  5 80
 80  8 20  4  0  0  0  2  0
 81  a 22  4 85  0  0  2  0
 82  a 61  4 88  0  0  2  0
 83  a  0  4 87  0  0  2  0
 84  c  0  4 7a  0  0  3  4
 85  8  0  4 f1  3  0  2  7
 86  c  0  4 88  0  0  2  7
 87  8  0  4 f2  2  0  2  7
 88  4  0  5  0  0  0  3  4
 89  d  0  4 fb  0  0  3  4
 8a  8  0  0  0  c  0  7 20
 8b  8 47  7  0  0  0  e 23
 8c  a 47  7 8c  0  0  8  0
 8d  d  0  4 e2  0  0  2 1f
 8e  8  0  5  0  8  0  2  0
 8f  d  0  4 f7  0  0  0  0
 90  8  a  4  2  1  0  2 3f
 91  a 49  4  0 12  0  0  0
 92  a 49  4 92 90  0  0  0
 93  d  0  4 eb 10  0  2  7
 94  d  0  4 d9  0  0  6  2
 95  d  0  4 7a  0  0  2 1f
 96  8 4b  5  0  0  0  0  0
 97  a  0  4  0  0  0  0  0
 98  c  0  4 8f 18  0  0  0
 99  8  0  4 14  2  0  7 10
 9a  8 2e  4  0  4  0  0  0
 9b  a 47  4 9e  0  0  0  0
 9c  a 2e  4 9b  0  0  0  0
 9d  c  0  4  0  0  0  3 10
 9e  c  0  4  0  2  0  3 10
 9f  8  0  0  0  0  0  7 80
 a0  8  0  4  0  0  0  7  2
 a1  c  0  4  0  0  0  0  0
 a2  8 19  4  0  0  0  2 17
 a3  a 19  4 a3  4  0  6  8
 a4  8  7  4  0  0  0  6 10
 a5  a 59  4 a8  0  0  2  0
 a6  a  7  4 a5  0  0  2  0
 a7  4  0  4  0  1  8  0  0
 a8  8  0  4 ff  1  2  0  0
 a9  4  0  4 ff  1  3  0  0
 aa  8  a  4  0  0  0  2 3f
 ab  a 49  4 b3 10  0  0  0
 ac  a 49  4 ac 90  0  0  0
 ad  d  0  4 eb  0  0  6  1
 ae  a  0  4 b0  0  0  0  0
 af  d  0  4 a2  0  0  2  7
 b0  8  0  c  0  1  0  2 3f
 b1  8  0  4  0 19  1  0  0
 b2  c  a  4 aa  0  4  0  0
 b3  8  0  4  0  0  0  4 28
 b4  8 49  4  0  8  0  0  0
 b5  8 49  4  0 10  0  0 3f
 b6  a 49  4 b6 90  0  0  0
 b7  8  0  c  0  1  0  0  0
 b8  8  0  4  0  1  1  0  0
 b9  8  0  4 3a  1  2  0  0
 ba  8  0  4 10  1  3  0  0
 bb  c  0  4  0  0  4  3 20
 bc  8 19  4  0  0  0  6  8
 bd  a 19  4 bd  0  0  2  6
 be  8 19  4 32  6  0  6 11
 bf  a 47  4 c2  0  0  2  0
 c0  a 19  4 bf  0  0  2  0
 c1  c  0  4 d0  0  0  0  0
 c2  8 21  4  0  3  8  2  0
 c3  a 60  4 c6  0  0  2  0
 c4  a 22  4 ce  0  0  2  0
 c5  8  0  4  0  0  4  0  0
 c6  8 59  4 1c  6  0  2 10
 c7  a 47  4 ca  0  0  2 10
 c8  a 59  4 c7  0  0  2 10
 c9  c  0  4 d0  0  0  0  0
 ca  8 21  4  0  3  8  2  0
 cb  a 60  4 be  0  0  2  0
 cc  a 22  4 ce  0  0  2  0
 cd  c  0  4 be  0  4  2  0
 ce  a  0  4 d0  0  0  0  0
 cf  c  0  4 79  0  0  0  0
 d0  4  0  4  0  0  0  0  0
 d1  8  0  0  0  8  0  0  0
 d2  c  0  4  0  0  0  0  0
 d3  8  0  0  0  1  0  0  0
 d4  8  0  0  0  1  1  0  0
 d5  c  0  4  0  0  0  0  0
 d6  8  0  0  0  1  2  0  0
 d7  8  0  0  0  1  3  0  0
 d8  c  0  4  0  0  0  0  0
 d9  8 19  4  0  0  0  2  0
 da  a 19  4 da  4  0  6  0
 db  8  7  4  0  0  0  e 10 Tst timer, DS=1, enable FBOUT
 dc  a 59  5 df  0  0  a  0
 dd  a  7  5 dc  0  0  a  0
 de  8  0  5  0  2  0  a  0
 df  8 60  5  0  0  0  a  0
 e0  a  0  4 69  0  0  0  0
 e1  4  0  4  0  0  0  2 15
 e2  8 19  4  0  0  0  2  0
 e3  a 19  4 e3  4  0  6  0
 e4  8  7  4  0  0  0  6 18
 e5  a 59  4 e8  0  0  2  0
 e6  a  7  4 e5  0  0  2  0
 e7  8  0  4  0  3  8  2  0
 e8  8 60  4  0  0  0  2  0
 e9  a  0  4 69  0  0  0  0
 ea  4  0  4  0  0  0  2 15
 eb  8 5b  4 1e  2  0  2  0
 ec  a 5b  4 ec  4  0  3  1
 ed  8  7  7  0  0  0  e 20
 ee  a 58  7 f1  0  0  f  1
 ef  a  7  7 ee  0  0  a  0
 f0  8  0  4  0  2  0  0  0
 f1  4 58  4  0  0  0  3  1
 f2  8  7  5 1e  2  0  e 20
 f3  a 58  5 f6  0  0  e  0
 f4  a  7  5 f3  0  0  e  0
 f5  8  0  4  0  2  0  0  0
 f6  4 58  4  0  0  0  0  0
 f7  8  0  4  0  1  0  3  4
 f8  8  0  4  0  1  1  0  0
 f9  8  0  4  0  1  2  0  0
 fa  4  0  4  0  1  3  0  0
 fb  8  0  4  0  0  0  2 7f
 fc  8  0  4  0  9  0  0 3f
 fd  8  0  4  0  1  1  1 3f
 fe  8  0  4  0  1  2  2 bf
 ff  4  0  4  0  1  3  3 1f
