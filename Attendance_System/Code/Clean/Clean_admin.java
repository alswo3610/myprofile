package Clean;
import config.*;

import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Clean_admin extends JPanel{
      
    private JPanel buttonPanel; // classname 버튼이 들어갈 패널
    private JPanel contentPanel; // 내용을 표시할 패널
    
    private CleanMgr cleanMgr;
    public Clean_admin() {
     try {
      
      setLayout(new BorderLayout());
      
      //반 버튼 패널 생성
      buttonPanel =new JPanel(new FlowLayout(FlowLayout.CENTER,0,0));
      add(buttonPanel,BorderLayout.NORTH);
      
      
      //내용 content 패널 생성  (top+center)
      contentPanel = new JPanel();
       contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
       JScrollPane scrollPane = new JScrollPane(contentPanel);
       scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
       scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
       add(scrollPane, BorderLayout.CENTER);
       
      
           
      try {
         cleanMgr = new CleanMgr(MysqlConnection.getConnection());

            
         Connection connection = MysqlConnection.getConnection();
         String query =Query.SELECT_CLASS_NAMES;
         PreparedStatement preparedStatement1 = connection.prepareStatement(query);
         ResultSet resultSet =QueryExecutor.executeQuery(query);
         
         while(resultSet.next()) {
            String className =resultSet.getString("class_name");
            
            JButton button =new JButton(className);
            button.setPreferredSize(new Dimension(275,82));
            button.setBackground(Color.WHITE);
            button.setFont(new Font("Inter",Font.BOLD,18));
            button.setBorderPainted(false);
            
            button.addActionListener(new ActionListener() {
               
               @Override
               public void actionPerformed(ActionEvent e) {
                  contentPanel.removeAll();
                  if (className.equals("cad1급반")) {
                          contentPanel.add(createCad1Panel());
                      } else if (className.equals("cad2급반")) {
                          contentPanel.add(createCad2Panel());
                      } else if (className.equals("java반")) {
                          contentPanel.add(createJavaPanel());
                      } else if (className.equals("컴활반")) {
                          contentPanel.add(createComPanel());
                      }
                      contentPanel.setBackground(Color.WHITE); // 모든 경우에 대해 배경색 설정
                      revalidate();
                      repaint();
                  
               }
            });
            buttonPanel.add(button);
         }
         resultSet.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   } catch (Exception e) {
      e.printStackTrace();
      }
    }
    
    
    
    private JPanel createCad1Panel() {
       
      JPanel cad1Panel = new CleanMgr(MysqlConnection.getConnection()).createCad1Panel();
      cad1Panel.setBorder(BorderFactory.createEmptyBorder());
      return cad1Panel; 
   }

   private JPanel createCad2Panel() {
      JPanel cad2Panel =new CleanMgr(MysqlConnection.getConnection()).createCad2Panel();
      cad2Panel.setBorder(BorderFactory.createEmptyBorder());
      return cad2Panel;
   }

   private JPanel createJavaPanel() {
      JPanel javaPanel =new CleanMgr(MysqlConnection.getConnection()).createJavaPanel();
      javaPanel.setBorder(BorderFactory.createEmptyBorder());
      return javaPanel;
   }

   private JPanel createComPanel() {
      JPanel comPanel =new CleanMgr(MysqlConnection.getConnection()).createComPanel();
      comPanel.setBorder(BorderFactory.createEmptyBorder());
      return comPanel;
   }
    



   public static void main(String[] args) {
      SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("managerCleanPanel");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.add(new Clean_admin());
            frame.pack();
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
        });
    }

   
}