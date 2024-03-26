package Announcement;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

import ProgramMgr.AttendanceManager;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent; // MouseAdapter와 MouseEvent 추가
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import config.*;

public class Announcement_stu extends JPanel{

    private DefaultTableModel model; // model을 필드로 선언
    private JScrollPane scrollPane; // 스크롤 패널도 필드로 선언
    private JTable table;
    private Connection connection;

    public Announcement_stu() {
        this.model = new DefaultTableModel(new String[]{"순번", "게시글", "작성자", "작성일자"}, 0);
        this.table = new JTable(model);
        this.connection = MysqlConnection.getConnection(); // 데이터베이스 연결 초기화
        showData();
    }

    private void showData() {
        model.setRowCount(0);
        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.setPreferredSize(new Dimension(1100, 770));

        // 버튼 담을 버튼 panel
        JPanel buttonPanel2 = new JPanel(new FlowLayout(FlowLayout.RIGHT));

        // 표 작성
        String[] columns = {"순번", "게시글", "작성자", "작성일자"};
        model = new DefaultTableModel(columns, 0); // 데이터 없이 빈 모델로 초기화
        table = new JTable(model);
        table.setPreferredScrollableViewportSize(new Dimension(1100, 720)); // 표의 크기 설정
        Font font = new Font("Inter", Font.PLAIN, 18);
        table.setFont(font);
        table.setDefaultEditor(Object.class, null); // Disable editing
        
        TableColumnModel columnModel = table.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(100); // 순번 열의 너비를 100으로 설정
        columnModel.getColumn(1).setPreferredWidth(500); // 게시글 열의 너비를 500으로 설정
        columnModel.getColumn(2).setPreferredWidth(200); // 작성자 열의 너비를 200으로 설정
        columnModel.getColumn(3).setPreferredWidth(200); // 작성일자 열의 너비를 200으로 설정
        table.setRowHeight(30); // 행의 높이를 30으로 설정
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setHeaderRenderer(new MyHeaderRenderer(font));
        }
        scrollPane = new JScrollPane(table); // 스크롤 패널 초기화

        // MouseListener를 추가하여 더블클릭 이벤트 처리
        table.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int selectedRow = table.getSelectedRow(); // 선택된 행 인덱스 가져오기
                if (selectedRow != -1) { // 선택된 행이 있을 경우에만 실행
                    String announcementTitle = (String) table.getValueAt(selectedRow, 1); // 선택된 행의 공지사항 제목 가져오기
                    JFrame frame = new JFrame("Announcement View");
                    frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // 창 닫기 버튼 동작 설정
                    frame.add(new Announcement_view(announcementTitle)); // Announcement_view 생성자에 공지사항 제목 전달
                    frame.pack();
                    frame.setLocationRelativeTo(null);
                    frame.setVisible(true);
                } else {
                    JOptionPane.showMessageDialog(Announcement_stu.this, "공지사항을 선택하세요.", "알림", JOptionPane.WARNING_MESSAGE);
                }
            }
        });

        mainPanel.add(scrollPane, BorderLayout.CENTER);
        mainPanel.add(buttonPanel2, BorderLayout.SOUTH);
        add(mainPanel);
        // 시작 시 바로 출력

        try {
            String username = UserInfo.getUserID();
            String className = AttendanceManager.getClassNameByUsername(username);
            String query = "SELECT announcement_num, announcement_title, announcement_writer, announcement_date " +
                           "FROM announcement " +
                           "WHERE announcement_class = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, className); // className 값을 설정
            ResultSet resultSet = statement.executeQuery();
            // 데이터를 JTable 모델에 추가하는 코드
            while (resultSet.next()) {
                int announcementNum = resultSet.getInt("announcement_num");
                String announcementTitle = resultSet.getString("announcement_title");
                String announcementWriter = resultSet.getString("announcement_writer");
                String announcementDate = resultSet.getString("announcement_date");
                model.addRow(new Object[]{announcementNum, announcementTitle, announcementWriter, announcementDate});
            }
            if (model.getRowCount() == 0) {
                JOptionPane.showMessageDialog(null, "공지사항이 없습니다.", "알림", JOptionPane.INFORMATION_MESSAGE);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static class MyHeaderRenderer implements TableCellRenderer {
        JLabel label;

        public MyHeaderRenderer(Font font) {
            label = new JLabel();
            label.setFont(font);
            label.setHorizontalAlignment(JLabel.CENTER);
            label.setBorder(BorderFactory.createEtchedBorder());
        }

        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            label.setText(value.toString());
            return label;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Main");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.add(new Announcement_stu());
            frame.pack();
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
        });
    }
}
