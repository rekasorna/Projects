/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sanashopping;

import java.awt.Font;
import java.awt.print.PrinterException;
import javax.swing.table.TableModel;

/**
 *
 * @author Afeeque
 */
public class print extends javax.swing.JFrame {

    /**
     * Creates new form print
     */
    public print() {
        initComponents();
    }
       
    String grandtotal1;
    String cash1;
    String balance1;

     public print(String grandtotal,String cash,String balance,TableModel tableModel) throws PrinterException {
        initComponents();
        this.grandtotal1 = grandtotal;
        this.cash1 = cash;
        this.balance1 = balance;
        txtprint.setFont(new Font("Times New Roman",Font.PLAIN,13));
        txtprint.setText(txtprint.getText()+ "---------------------------------------------------------------------------------------------------\n");
        txtprint.setText(txtprint.getText()+ "---------------------------------SARA SUPER MARKET--------------------------------\n");
        txtprint.setText(txtprint.getText()+ "--------------------------------------------KATPADI------------------------------------------\n");
        txtprint.setText(txtprint.getText()+ "\n");
        txtprint.setText(txtprint.getText()+ "Name of the Item(s)" + "\t\t" + "Price"+ "\t" + "Quantity"+ "\t" + "Total\n");
        txtprint.setText(txtprint.getText()+ "---------------------------------------------------------------------------------------------------\n");
        for(int i=0;i<tableModel.getRowCount();i++)
        {
            String product = (String) tableModel.getValueAt(i, 1);
            String price = (String) tableModel.getValueAt(i, 2);
            String quantity = (String) tableModel.getValueAt(i, 3);
            int total = (int) tableModel.getValueAt(i, 4);
            txtprint.setText(txtprint.getText()+ product + "\t\t\t" + price + "\t" + quantity + "\t" + total +"\n");
        }
        txtprint.setText(txtprint.getText()+ "\n");
        txtprint.setText(txtprint.getText()+ "\n");
        txtprint.setText(txtprint.getText()+ "---------------------------------------------------------------------------------------------------\n");
        txtprint.setText(txtprint.getText()+ "\t\t" + "Grand Total" + "\t\t\t" + grandtotal + "\n");
        txtprint.setText(txtprint.getText()+ "\t\t" + "Cash Received " + "\t\t" +  cash + "\n");
        txtprint.setText(txtprint.getText()+ "\t\t" + "Balance Given" +  "\t\t" + balance + "\n");
        txtprint.setText(txtprint.getText()+ "---------------------------------------------------------------------------------------------------\n");
        txtprint.setText(txtprint.getText()+ "------------------------------Thank You..!! Visit Again-----------------------------------\n");
        
        txtprint.print();
     
    }
 
   

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        txtprint = new javax.swing.JTextArea();
        jPanel1 = new javax.swing.JPanel();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setPreferredSize(new java.awt.Dimension(418, 445));

        txtprint.setColumns(20);
        txtprint.setRows(5);
        jScrollPane1.setViewportView(txtprint);

        jPanel1.setBackground(new java.awt.Color(0, 102, 102));

        jButton2.setFont(new java.awt.Font("Tw Cen MT", 0, 16)); // NOI18N
        jButton2.setText("CLOSE");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(154, 154, 154)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(153, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jButton2)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 332, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        print p = new print();
        this.hide();
        p.setVisible(false);
        
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(print.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(print.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(print.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(print.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new print().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea txtprint;
    // End of variables declaration//GEN-END:variables
}
