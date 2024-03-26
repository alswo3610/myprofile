package Counseling;
import config.*;
import Clean.*;



import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;

public class Counseling_admin extends JPanel implements ActionListener{
	   
	   private JTable table;
	   private DefaultTableModel tableModel;
	   private Connection conn;
	    private final List<String> CLASS_NAMES = Class_Name.CLASS_NAMES;
	    private DefaultTableModel model; // model을 필드로 선언
	    private JScrollPane scrollPane; // 스크롤 패널도 필드로 선언
	     private String classindex;
	    public Counseling_admin() {
	      
	      try {
	           conn = MysqlConnection.getConnection();
	         
	           setLayout(new BorderLayout());
	           
	           JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
	           add(buttonPanel, BorderLayout.NORTH);

	           try {
	               String query1 = Query.SELECT_CLASS_NAMEUP;
	               ResultSet rs1 = QueryExecutor.executeQuery(query1);

	               List<String> classNames = new ArrayList<>();
	               while (rs1.next()) {
	                   String className = rs1.getString("class_name");
	                   classNames.add(className);
	               }
	               rs1.close();
	               for (String className : classNames) {
	                   JButton button = new JButton(className);
	                   button.setPreferredSize(new Dimension(275, 82));
	                   button.setBackground(Color.WHITE);
	                   button.setFont(new Font("Inter", Font.PLAIN, 18));
	                   button.setBorderPainted(false);
	                   button.addActionListener(this); // ActionListener 추가
	                   buttonPanel.add(button);
	               }
	           } catch (Exception e) {
	               e.printStackTrace();
	           }
	           
	           // 표 작성
	           String[] columns = {"번호", "아이디", "보낸 사람", "신청 날짜","제목"};
	           tableModel = new DefaultTableModel(columns, 0); // 데이터 없이 빈 모델로 초기화
	           JTable table = new JTable(tableModel);
	           table.setPreferredScrollableViewportSize(new Dimension(1100, 720)); // 표의 크기 설정
	           Font font = new Font("Inter", Font.PLAIN, 18);
	           table.setFont(font);

	           for (int i = 0; i < table.getColumnCount(); i++) {
	               table.getColumnModel().getColumn(i).setHeaderRenderer(new MyHeaderRenderer(font));
	           }
	           scrollPane = new JScrollPane(table); // 스크롤 패널 초기화
	           //  loadData();
	           add(scrollPane,BorderLayout.CENTER);
	           
	           //데이터 로드 및 테이블 추가
	           
	           //제목을 클릭할 때 이벤트 처리
	           table.addMouseListener(new java.awt.event.MouseAdapter() {
	              @Override
	              public void mouseClicked(java.awt.event.MouseEvent evt) {
	                 int row = table.rowAtPoint(evt.getPoint());
	                 int column = table.columnAtPoint(evt.getPoint());
	                 if(row>=0 && column ==4) {   //제목 열 클릭시
	                    String counselingTitle =(String) tableModel.getValueAt(row, column);
	                    showContentDialog(counselingTitle);      //새 창에 내용 표시
	                 }
	              }
	              
	           });
	       } catch (Exception e) {
	           e.printStackTrace();
	           JOptionPane.showMessageDialog(this, "데이터베이스 연결을 초기화하는 중 오류가 발생했습니다.");
	       }
	   }
	   
	   
	   //데이터베이스에서 데이터를 가져와서 테이블에 추가하는 메서드
	   private void loadData(String className) {
	      try{
	         String sql = "SELECT c.counseling_num, c.counseling_date, c.counseling_title, c.user_id, c.counseling_class " +
	                   "FROM counseling c " +
	                   "JOIN user u ON c.user_id = u.user_id " +
	                   "WHERE u.class_name = ?"+ 
	                   "ORDER BY c.counseling_num DESC";
	         try(Statement stmt = this.conn.createStatement();
	               ResultSet rs = stmt.executeQuery(sql)){
	            List<Object[]> rows =new ArrayList<>();
	            while(rs.next()) {
	               String counselingNum = rs.getString("counseling_num");
	               String userId = rs.getString("user_id");
	               String userName = rs.getString("user_name");
	               Timestamp counselingDate = rs.getTimestamp("counseling_date");
	               String formattedDate = new SimpleDateFormat("yyyy-   MM-dd").format(counselingDate); // 날짜 형식 수정
	               String counselingTitle = rs.getString("counseling_title");
	               rows.add(new Object[] {counselingNum, userId, userName,  formattedDate, counselingTitle});    //날짜 형식 적용
	            }
	            
	            //리스트를 테이블에 추가
	            for (Object[] row : rows) {
	               tableModel.addRow(row);
	            }
	         } 
	      } catch (Exception e) {
	         e.printStackTrace();
	         JOptionPane.showMessageDialog(this, "데이터를 불러오는 중 오류가 발생했습니다..");
	      }
	   }

	   //제목을 클릭했을 때 해당 내용을 새 창에 표시하는 메서드
	   private void showContentDialog(String counselingTitle) {
	      try{
	         String sql ="SELECT counseling_content FROM counseling WHERE counseling_title =?";
	         try (PreparedStatement psmt =this.conn.prepareStatement(sql)){
	            psmt.setString(1, counselingTitle);
	            try (ResultSet rs = psmt.executeQuery()){
	               if(rs.next()) {
	                  String content =rs.getString("counseling_content");
	                  JTextArea ta =new JTextArea(content);
	                  JScrollPane scrollPane =new JScrollPane(ta);
	                  scrollPane.setPreferredSize(new Dimension(500,300));
	                  JOptionPane.showMessageDialog(this, scrollPane);
	                  
	               } else {
	                  JOptionPane.showMessageDialog(this, "해당 제목에 대한 내용을 찾을 수 없습니다.");
	               }
	            } 
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	         JOptionPane.showMessageDialog(this, "내용을 불러오는 중 오류가 발생했습니다.");
	      }
	   }
	   
	   
	   @Override
	   public void actionPerformed(ActionEvent e) {
	       JButton source = (JButton) e.getSource(); // 이벤트가 발생한 버튼 가져오기
	          String className = source.getText(); // 버튼의 텍스트(클래스 이름) 가져오기
	           classindex = source.getText();
	           System.out.println("눌러진 버튼의 텍스트: " + classindex);

	          // 각 버튼의 동작을 if문으로 구분하여 정의
	          if (className.equals(CLASS_NAMES.get(0))) {
	              // 첫번째 버튼이 클릭되었을 때의 동작
	              System.out.println("1번째 버튼이 클릭되었습니다.");
	              
	              ////////////////////////////////////////////////////////////////////
	              // 버튼 누르면 나오는 동작을 AnnouncementMgr처럼 ex) xxxMgr 구현하고
	              // 아래랑 같은 방식으로 표현하면 될거 같아요.
	              // SELECT_CAD1_TABLE는 QUERY라는 클래스 파일 보시면 선언했습니다.
	              // 
	              CounselingMgr counselingMgr = new CounselingMgr(tableModel);
	              counselingMgr.cad1Data(Query.SELECT_COUNSECAD1_TABLE);
	              ////////////////////////////////////////////////////////////////////
	          } else if (className.equals(CLASS_NAMES.get(1))) {
	              // 두번째 버튼이 클릭되었을 때의 동작
	              System.out.println("2번째 버튼이 클릭되었습니다.");
	              CounselingMgr counselingMgr = new  CounselingMgr(tableModel);
	              counselingMgr.cad2Data(Query.SELECT_COUNSECAD2_TABLE);
	          } else if (className.equals(CLASS_NAMES.get(2))) {
	              // 세번째 버튼이 클릭되었을 때의 동작
	              System.out.println("3번째 버튼이 클릭되었습니다.");
	              CounselingMgr counselingMgr = new CounselingMgr(tableModel);
	              counselingMgr.javaData(Query.SELECT_COUNSEJAVA_TABLE);
	          } else if (className.equals(CLASS_NAMES.get(3))) {
	              // 네번째 버튼이 클릭되었을 때의 동작
	              System.out.println("4번째 버튼이 클릭되었습니다.");
	              CounselingMgr counselingMgr = new CounselingMgr(tableModel);
	              counselingMgr.computerData(Query.SELECT_COUNSECOMPUTER_TABLE);
	          }
	          // 이런 식으로 필요한 만큼 추가할 수 있습니다.
	      }
	   
	   
	   public static void main(String[] args) {
	      SwingUtilities.invokeLater(() -> {
	            JFrame frame = new JFrame("제목을 클릭하면 내용을 볼수 있습니다.");
	            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	            frame.add(new Counseling_admin());
	            frame.pack();
	            frame.setLocationRelativeTo(null);
	            frame.setVisible(true);
	        });
	    }

	   
	}