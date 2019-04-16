package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import reserve.vo.CalVo;
import reserve.vo.RvdetailVo;
import reserve.vo.RvinitviewVo;
import reserve.vo.RvmainVo;
import reserve.vo.RvresultVo;

/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */



public class ReserveDao {

	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	private static ReserveDao dao = new ReserveDao();
	private ReserveDao() {}
	
	public static ReserveDao getInstance() {
		return dao;
	}	
	


	//달력형 일자별 예약정보 Get
	public List<CalVo> listCal(String ym, int psidx) {
		
		List<CalVo> list = new ArrayList<>();
		String sql = "select  " + 
						"    v1000.d1,  " + 
						"    decode(v1000.d1,0,0,  " + 
						"            case when v1000.d1_rmcnt = v1000.d1_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d1_rv,  " + 
						"    v1000.d2,  " + 
						"    decode(v1000.d2,0,0,  " + 
						"            case when v1000.d2_rmcnt = v1000.d2_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d2_rv,  " + 
						"    v1000.d3,  " + 
						"    decode(v1000.d3,0,0,  " + 
						"            case when v1000.d3_rmcnt = v1000.d3_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d3_rv,  " + 
						"    v1000.d4,  " + 
						"    decode(v1000.d4,0,0,  " + 
						"            case when v1000.d4_rmcnt = v1000.d4_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d4_rv,          " + 
						"    v1000.d5,  " + 
						"    decode(v1000.d5,0,0,  " + 
						"            case when v1000.d5_rmcnt = v1000.d5_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d5_rv,        " + 
						"    v1000.d6,  " + 
						"    decode(v1000.d6,0,0,  " + 
						"            case when v1000.d6_rmcnt = v1000.d6_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d6_rv,     " + 
						"    v1000.d7,  " + 
						"    decode(v1000.d7,0,0,  " + 
						"            case when v1000.d7_rmcnt = v1000.d7_rvrmcnt   " + 
						"                 then 1 else 0  " + 
						"            end) d7_rv       " + 
						"from  " + 
						"    (  " + 
						"    select  " + 
						"        v100.iw,  " + 
						"        sum(decode(v100.wd,1,v100.d,0)) as d1,  " + 
						"        sum(decode(v100.wd,1,v100.rm_cnt,0)) as d1_rmcnt,  " + 
						"        sum(decode(v100.wd,1,v100.rv_rm_cnt,0)) as d1_rvrmcnt,  " + 
						"        sum(decode(v100.wd,2,v100.d,0)) as d2,  " + 
						"        sum(decode(v100.wd,2,v100.rm_cnt,0)) as d2_rmcnt,  " + 
						"        sum(decode(v100.wd,2,v100.rv_rm_cnt,0)) as d2_rvrmcnt,  " + 
						"        sum(decode(v100.wd,3,v100.d,0)) as d3,  " + 
						"        sum(decode(v100.wd,3,v100.rm_cnt,0)) as d3_rmcnt,  " + 
						"        sum(decode(v100.wd,3,v100.rv_rm_cnt,0)) as d3_rvrmcnt,  " + 
						"        sum(decode(v100.wd,4,v100.d,0)) as d4,  " + 
						"        sum(decode(v100.wd,4,v100.rm_cnt,0)) as d4_rmcnt,  " + 
						"        sum(decode(v100.wd,4,v100.rv_rm_cnt,0)) as d4_rvrmcnt,  " + 
						"        sum(decode(v100.wd,5,v100.d,0)) as d5,  " + 
						"        sum(decode(v100.wd,5,v100.rm_cnt,0)) as d5_rmcnt,  " + 
						"        sum(decode(v100.wd,5,v100.rv_rm_cnt,0)) as d5_rvrmcnt,  " + 
						"        sum(decode(v100.wd,6,v100.d,0)) as d6,  " + 
						"        sum(decode(v100.wd,6,v100.rm_cnt,0)) as d6_rmcnt,  " + 
						"        sum(decode(v100.wd,6,v100.rv_rm_cnt,0)) as d6_rvrmcnt,  " + 
						"        sum(decode(v100.wd,7,v100.d,0)) as d7,  " + 
						"        sum(decode(v100.wd,7,v100.rm_cnt,0)) as d7_rmcnt,  " + 
						"        sum(decode(v100.wd,7,v100.rv_rm_cnt,0)) as d7_rvrmcnt  " + 
						"    from  " + 
						"        (  " + 
						"        select  " + 
						"            v10.ymd,  " + 
						"            v10.iw,  " + 
						"            v10.wd,  " + 
						"            v10.d,  " + 
						"            v20.rm_cnt,  " + 
						"            v20.rv_rm_cnt  " + 
						"        from  " + 
						"            (       " + 
						"            select  " + 
						"                v1.ymd as ymd,  " + 
						"                case to_number(v1.wd)  " + 
						"                    when 1 then to_number(to_char(v1.ymd,'iw')) + 1  " + 
						"                    else   " + 
						"                        case to_number(to_char(v1.ymd,'mm'))  " + 
						"                            when 12 then   " + 
						"                               case to_number(to_char(v1.ymd,'iw'))  " + 
						"                                    when 1 then v3.max_iw  " + 
						"                                    else to_number(to_char(v1.ymd,'iw'))  " + 
						"                               end  " + 
						"                            else                      " + 
						"                                to_number(to_char(v1.ymd,'iw'))  " + 
						"                        end  " + 
						"                end iw,  " + 
						"                to_number(v1.wd) as wd,  " + 
						"                v1.d as d  " + 
						"            from  " + 
						"                (  " + 
						"                select  " + 
						"                    to_date(v.ym || trim(to_char(a.rn,'00'))) as ymd,  " + 
						"                    to_char(to_date(v.ym || trim(to_char(a.rn,'00'))),'d') as wd,  " + 
						"                    a.rn as d  " + 
						"                from  " + 
						"                    (  " + 
						"                     select   " + 
						"                        to_char(to_date(ymd),'yyyymm') as ym,  " + 
						"                        to_number(to_char(last_day(to_date(ymd)),'dd')) as last_d  " + 
						"                     from  " + 
						"                        (  " + 
						"                          select ? || '01' as ymd from dual  " + 
						"                        )  " + 
						"                    ) v,                   " + 
						"                    (  " + 
						"                      select rownum as rn from dict  " + 
						"                    ) a  " + 
						"                where  " + 
						"                    a.rn <= v.last_d  " + 
						"                ) v1,  " + 
						"                (  " + 
						"                select  " + 
						"                    max(iw) as max_iw  " + 
						"                from  " + 
						"                    (  " + 
						"                    select  " + 
						"                         case to_number(v1.wd)  " + 
						"                            when 1 then to_number(to_char(v1.ymd,'iw')) + 1  " + 
						"                            else to_number(to_char(v1.ymd,'iw'))  " + 
						"                        end iw  " + 
						"                    from  " + 
						"                        (  " + 
						"                        select  " + 
						"                            to_date(v.ym || trim(to_char(a.rn,'00'))) as ymd,  " + 
						"                            to_char(to_date(v.ym || trim(to_char(a.rn,'00'))),'d') as wd,  " + 
						"                            a.rn as d  " + 
						"                        from  " + 
						"                            (  " + 
						"                             select   " + 
						"                                to_char(to_date(ymd),'yyyymm') as ym,  " + 
						"                                to_number(to_char(last_day(to_date(ymd)),'dd')) as last_d  " + 
						"                             from  " + 
						"                                (  " + 
						"                                  select to_char(to_date( ? || '01' ),'yyyy')||'1231' as ymd from dual  " + 
						"                                )  " + 
						"                            ) v,                   " + 
						"                            (  " + 
						"                              select rownum as rn from dict  " + 
						"                            ) a  " + 
						"                        where  " + 
						"                            a.rn <= v.last_d  " + 
						"                        ) v1  " + 
						"                    )v2  " + 
						"                ) v3  " + 
						"            ) v10,  " + 
						"            (  " + 
						"            select  " + 
						"                t1.ymd,  " + 
						"                t1.d,  " + 
						"                t2.rm_cnt,  " + 
						"                 (  " + 
						"                select  " + 
						"                    count(*)   " + 
						"                from  " + 
						"                    rvsub  " + 
						"                where   " + 
						"                    t1.ymd between sdate and edate  " + 
						"                and psidx = ?  " + 
						"                ) as rv_rm_cnt  " + 
						"            from  " + 
						"                (  " + 
						"                select  " + 
						"                    to_date(v.ym || trim(to_char(a.rn,'00'))) as ymd,  " + 
						"                    a.rn as d  " + 
						"                from  " + 
						"                    (  " + 
						"                     select   " + 
						"                        to_char(to_date(ymd),'yyyymm') as ym,  " + 
						"                        to_number(to_char(last_day(to_date(ymd)),'dd')) as last_d  " + 
						"                     from  " + 
						"                        (  " + 
						"                          select ? || '01' as ymd from dual  " + 
						"                        )  " + 
						"                    ) v,                   " + 
						"                    (  " + 
						"                      select rownum as rn from dict  " + 
						"                    ) a  " + 
						"                where  " + 
						"                    a.rn <= v.last_d  " + 
						"                ) t1,  " + 
						"                (  " + 
						"                select   " + 
						"                    a.psidx,   " + 
						"                    a.pstitle,   " + 
						"                    count(*) as rm_cnt  " + 
						"                from  " + 
						"                    pension a,  " + 
						"                    room    b  " + 
						"                where  " + 
						"                    a.psidx = ?  " + 
						"                and a.psidx = b.psidx      " + 
						"                group by  " + 
						"                    a.psidx,  " + 
						"                    a.pstitle  " + 
						"              ) t2  " + 
						"            ) v20  " + 
						"        where  " + 
						"            v10.ymd = v20.ymd  " + 
						"        ) v100          " + 
						"    group by  " + 
						"        v100.iw  " + 
						"    ) v1000          " + 
						"order by  " + 
						"    iw";
		
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
//			System.out.println();
//			System.out.println(sql);
//			System.out.println("ym : "+ym+" psidx : "+psidx);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ym);
			pstmt.setString(2, ym);
			pstmt.setInt(3, psidx);
			pstmt.setString(4, ym);
			pstmt.setInt(5, psidx);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { // 행이 있을 때
				
				CalVo cvo = new CalVo();
				int idx = 0;
				cvo.setD1(rs.getInt(++idx));
				cvo.setD1_rv(rs.getInt(++idx));
				cvo.setD2(rs.getInt(++idx));
				cvo.setD2_rv(rs.getInt(++idx));
				cvo.setD3(rs.getInt(++idx));
				cvo.setD3_rv(rs.getInt(++idx));
				cvo.setD4(rs.getInt(++idx));
				cvo.setD4_rv(rs.getInt(++idx));
				cvo.setD5(rs.getInt(++idx));
				cvo.setD5_rv(rs.getInt(++idx));
				cvo.setD6(rs.getInt(++idx));
				cvo.setD6_rv(rs.getInt(++idx));
				cvo.setD7(rs.getInt(++idx));
				cvo.setD7_rv(rs.getInt(++idx));
				
				list.add(cvo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	
	
	//전달0,현재달1,다음달2 Get
	public String[] getCurNextYm(String ymd) {
		
		String[] result = new String[3];
		String sql = "select  " + 
					 "    to_char(add_months(ymd,-1),'yyyymm') as p_ym, " +
					 "    to_char(ymd,'yyyymm') as c_ym,  " + 
					 "    to_char(add_months(ymd,1),'yyyymm') as n_ym  " + 
					 "from  " + 
					 "    (  " + 
					 "    select   " + 
					 "        to_date( ? ) as ymd  " + 
					 "    from  " + 
					 "        dual  " + 
					 "    )";
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result[0] = rs.getString(1);
				result[1] = rs.getString(2);
				result[2] = rs.getString(3);
				System.out.println("result[0] : "+result[0]+" [1] : "+result[1]+" [2] : "+result[2]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}	

	
	//팬션에 대한 각 방에 대한 초기 List
	public List<RvinitviewVo> listInitRoom(String ymd, int psidx){
		
		List<RvinitviewVo> list = new ArrayList<>();
		String sql = "select  " + 
					"        v10.psidx,  " + 
					"        v10.pstitle,  " + 
					"        v10.rm_cnt,  " + 
					"        v10.rmidx,  " + 
					"        v10.rmtitle,  " + 
					"        v10.rmsize,  " + 
					"        v10.rmpermin,  " + 
					"        v10.rmpermax,  " + 
					"        case when v10.status in (1,9)  " + 
					"            then 0  " + 
					"            else nvl(v10.ava_night,999)  " + 
					"        end ava_night,  " + 
					"        v10.base_amt,  " + 
					"        v10.min_amt,  " + 
					"        v10.status  " + 
					"    from  " + 
					"        (  " + 
					"        select   " + 
					"            t1.psidx,  " + 
					"            t1.pstitle,  " + 
					"            (   " + 
					"              select   " + 
					"                  count(*)  " + 
					"              from  " + 
					"                  room  " + 
					"              where      " + 
					"                  psidx = t1.psidx  " + 
					"            ) as rm_cnt,  " + 
					"            t2.rmidx,  " + 
					"            t2.rmtitle,  " + 
					"            t2.rmsize,  " + 
					"            t2.rmpermin,  " + 
					"            t2.rmpermax,  " + 
					"            (  " + 
					"                select   " + 
					"                      min(to_date(to_char(sa.sdate,'yyyymmdd')) - sv.cymd) as ava_night  " + 
					"                from   " + 
					"                      rvsub sa,  " + 
					"                      (  " + 
					"                        select   " + 
					"                              to_date( ? ) as cymd from dual  " + 
					"                      ) sv               " + 
					"                where   " + 
					"                     sv.cymd <= to_date(to_char(sa.sdate,'yyyymmdd'))  " + 
					"                and sa.psidx = t1.psidx  " + 
					"                and sa.rmidx = t2.rmidx  " + 
					"                and to_date(to_char(sa.sdate,'yyyymmdd')) - sv.cymd > 0  " + 
					"            ) as ava_night,  " + 
					"            nvl(v1.base_amt,0) as base_amt,  " + 
					"            nvl(v1.base_amt * rmpermin,0) as min_amt,  " + 
					"            t3.sdate,  " + 
					"            t3.edate,  " + 
					"            case when v1.ymd < to_date(to_char(sysdate,'yyyymmdd'))  " + 
					"              then 9  " + 
					"              else nvl(t3.status,0)  " + 
					"            end status,  " + 
					"            t2.rorder  " + 
					"        from  " + 
					"            pension t1,  " + 
					"            room    t2,  " + 
					"            rvsub   t3,  " + 
					"            (      " + 
					"                select  " + 
					"                    b.rmidx,  " + 
					"                    case v.charge_type   " + 
					"                        when 1 then b.week  " + 
					"                        when 2 then b.fri  " + 
					"                        when 3 then b.weekend  " + 
					"                    end base_amt,  " + 
					"                    v.ymd  " + 
					"                from  " + 
					"                    room   a,  " + 
					"                    charge b,  " + 
					"                    (  " + 
					"                    select  " + 
					"                        ymd as ymd,  " + 
					"                        case when to_char(ymd,'d') between 1 and 5 then 1  " + 
					"                             when to_char(ymd,'d') = 6 then 2  " + 
					"                             when to_char(ymd,'d') = 7 then 3  " + 
					"                        end charge_type,  " + 
					"                        case when to_char(ymd,'mm') in ('01','07','08','12')  " + 
					"                             then 1 else 0  " + 
					"                        end charge_period  " + 
					"                    from  " + 
					"                        (  " + 
					"                        select   " + 
					"                              to_date( ? ) as ymd from dual  " + 
					"                        )  " + 
					"                    ) v      " + 
					"                where   " + 
					"                    a.psidx = ?  " + 
					"                and a.rmidx = b.rmidx  " + 
					"                and b.period = v.charge_period    " + 
					"            ) v1           " + 
					"        where  " + 
					"            t1.psidx = ?  " + 
					"        and t1.psidx = t2.psidx  " + 
					"        and t2.rmidx = v1.rmidx(+)  " + 
					"        and t2.psidx = t3.psidx(+)  " + 
					"        and t2.rmidx = t3.rmidx(+)  " + 
					"        and to_date( ? ) between t3.sdate(+) and t3.edate(+)  " + 
					"        ) v10          " + 
					"    order by   " + 
					"       v10.rorder";
		
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
//			System.out.println();
//			System.out.println(sql);
//			System.out.println("ymd : "+ymd+" psidx : "+psidx);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setString(2, ymd);			
			pstmt.setInt(3, psidx);
			pstmt.setInt(4, psidx);
			pstmt.setString(5, ymd);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { // 행이 있을 때
				
				RvinitviewVo rvo = new RvinitviewVo();
				int idx = 0;
				rvo.setPsidx(rs.getInt(++idx));
				rvo.setPstitle(rs.getString(++idx));
				rvo.setRmcnt(rs.getInt(++idx));
				rvo.setRmidx(rs.getInt(++idx));
				rvo.setRmtitle(rs.getString(++idx));
				rvo.setRmsize(rs.getInt(++idx));
				rvo.setRmpermin(rs.getInt(++idx));
				rvo.setRmpermax(rs.getInt(++idx));
				rvo.setAva_night(rs.getInt(++idx));
				rvo.setBaseamt(rs.getInt(++idx));
				rvo.setMin_amt(rs.getInt(++idx));
				rvo.setStatus(rs.getInt(++idx));
				
				list.add(rvo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
		
	}
	
	
	//예약번호 생성
	public long Creation_RvNo() {
		long result = 0;
		String sql = "select  " + 
					"    nvl(max(rvidx)+1,to_number(to_char(sysdate,'yyyymmdd')||'001')) as new_rvidx  " + 
					"from  " + 
					"    rvmain  " + 
					"where  " + 
					"   substr(to_char(rvidx),1,8) = to_char(sysdate,'yyyymmdd')";
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}	

	
	//팬션에 예약 저장
	public long Ins_PsRoomReservation(RvmainVo mvo, List<RvdetailVo> dlist) {
		String sql1 = "insert into rvmain (rvidx, email, name, tel, email2, totmoney, reqtext) values (?, ?, ?, ?, ?, ?, ?)";
		String sql2 = "insert into rvsub (rvidx, rvsub, baseamt, night, perscnt, status, sdate, edate, psidx, rmidx) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		long newRvNo=0;
		PreparedStatement pstmt1;
		
		//생성된 예약번호	
		newRvNo = Creation_RvNo(); 	
		System.out.println("new no :: "+newRvNo);

		conn = DBManager.getConnection();
		
		try {
			conn.setAutoCommit(false);
			
			
			//예약 Main
			pstmt = conn.prepareStatement(sql1);
			int idx = 0;
			pstmt.setLong(++idx, newRvNo);
			pstmt.setString(++idx, mvo.getEmail());
			pstmt.setString(++idx, mvo.getName());
			pstmt.setString(++idx, mvo.getTel());
			pstmt.setString(++idx, mvo.getEmail2());
			pstmt.setInt(++idx, mvo.getTotmoney());
			pstmt.setString(++idx, mvo.getReqtext());
			
			pstmt.executeUpdate();
			pstmt.close();
			
			//예약 Detail
			pstmt = conn.prepareStatement(sql2);
			
			for(int i=0;i<dlist.size();i++) {
				int idx2 = 0;
				pstmt.setLong(++idx2, newRvNo);
				pstmt.setInt(++idx2, i+1);
				pstmt.setInt(++idx2, dlist.get(i).getBaseamt());
				pstmt.setInt(++idx2, dlist.get(i).getNight());
				pstmt.setInt(++idx2, dlist.get(i).getPerscnt());
				pstmt.setInt(++idx2, dlist.get(i).getStatus());
				pstmt.setString(++idx2, dlist.get(i).getSdate());
					//종료일 계산
					pstmt1 = conn.prepareStatement("select to_char(to_date(?) + ? - 1,'yyyymmdd') from dual");
					pstmt1.setString(1, dlist.get(i).getSdate());
					pstmt1.setInt(2, dlist.get(i).getNight());
					ResultSet rs = pstmt1.executeQuery();
					rs.next();
					String s_Edate = rs.getString(1);
					pstmt1.close();
					System.out.println("sdate :: "+s_Edate);
				pstmt.setString(++idx2, s_Edate);
				pstmt.setInt(++idx2, dlist.get(i).getPsidx());
				pstmt.setInt(++idx2, dlist.get(i).getRmidx());
				
				pstmt.executeUpdate();
			}
			
			conn.commit();
			DBManager.close(conn, pstmt, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return newRvNo;
		
	}	
	
		
	//현재,다음달력날짜 선택에 의한 기준날짜
	public String getStandardDate(String ymd, int stdval) {
		String result = "";
		String sql = "select to_char(add_months(to_date(?),?),'yyyymm')||'01' from dual";
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setInt(2, stdval);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}		
	
	
	//오늘 날짜
	public String getToDate() {
		String result = "";
		String sql = "select to_char(sysdate,'yyyymmdd') as todate from dual";
				
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;		
	}
	
	
	
	//팬션예약 결과에 대한 List
	public List<RvresultVo> listRvrmResult(long rvidx) {
		
		List<RvresultVo> list = new ArrayList<>();
		String sql = "select   " + 
						"    a.rvidx,  " + 
						"    a.email,  " + 
						"    a.name,  " + 
						"    a.tel,  " + 
						"    a.email2,  " + 
						"    a.totmoney,  " + 
						"    a.reqtext,  " + 
						"    b.rvsub,  " + 
						"    b.baseamt,  " + 
						"    b.night,  " + 
						"    b.perscnt,  " + 
						"    b.status,  " + 
						"    to_char(b.sdate,'yyyy-mm-dd'),  " + 
						"    to_char(b.edate,'yyyy-mm-dd'),  " + 
						"    b.psidx,  " + 
						"    c.pstitle,  " + 
						"    b.rmidx,  " + 
						"    d.rmtitle  " + 
						"from  " + 
						"    rvmain  a,  " + 
						"    rvsub   b,  " + 
						"    pension c,  " + 
						"    room    d  " + 
						"where  " + 
						"    a.rvidx = ?  " + 
						"and a.rvidx = b.rvidx    " + 
						"and b.psidx = c.psidx  " + 
						"and b.psidx = d.psidx  " + 
						"and b.rmidx = d.rmidx  " + 
						"order by  " + 
						"    d.rorder";
		
		conn = DBManager.getConnection();
		pstmt = null;
		rs = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, rvidx);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { // 행이 있을 때
				
				RvresultVo rvo = new RvresultVo();
				int idx = 0;
				rvo.setRvidx(rs.getLong(++idx));
				rvo.setEmail(rs.getString(++idx));
				rvo.setName(rs.getString(++idx));
				rvo.setTel(rs.getString(++idx));
				rvo.setEmail2(rs.getString(++idx));
				rvo.setTotmoney(rs.getInt(++idx));
				rvo.setReqtext(rs.getString(++idx));
				rvo.setRvsub(rs.getInt(++idx));
				rvo.setBaseamt(rs.getInt(++idx));
				rvo.setNight(rs.getInt(++idx));
				rvo.setPerscnt(rs.getInt(++idx));
				rvo.setStatus(rs.getInt(++idx));
				rvo.setSdate(rs.getString(++idx));
				rvo.setEdate(rs.getString(++idx));
				rvo.setPsidx(rs.getInt(++idx));
				rvo.setPstitle(rs.getString(++idx));
				rvo.setRmidx(rs.getInt(++idx));
				rvo.setRmtitle(rs.getString(++idx));
				
				list.add(rvo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
		
	}	
	
}
