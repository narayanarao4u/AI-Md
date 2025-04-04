To create a new Group Policy in Server 2016 that allows users to change their Network IP address, follow these steps:

1. **Open Group Policy Management**: On your domain controller, open the Group Policy Management Console (GPMC).

2. **Create a New Group Policy Object (GPO)**:
   - Right-click on the Organizational Unit (OU) where you want to apply the policy.
   - Select **Create a GPO in this domain, and Link it here**.
   - Name the GPO (e.g., "Allow IP Change").

3. **Edit the GPO**:
   - Right-click on the newly created GPO and select **Edit**.
   - Navigate to **User Configuration** > **Administrative Templates** > **Network** > **Network Connections**.

4. **Configure Network Connection Settings**:
   - Find and double-click on **Prohibit access to properties of a LAN connection**.
   - Set it to **Disabled**.
   - Find and double-click on **Ability to enable/disable a LAN connection**.
   - Set it to **Enabled**.

5. **Add Users to Network Configuration Operators Group**:
   - Go to **Computer Configuration** > **Windows Settings** > **Security Settings** > **Restricted Groups**.
   - Right-click on **Restricted Groups** and select **Add Group**.
   - Enter **Network Configuration Operators** and click **OK**.
   - Right-click on **Network Configuration Operators** and select **Add** under **Members of this group**.
   - Add the **Domain Users** group or specific users you want to grant this permission to.

6. **Apply and Update**:
   - Close the Group Policy Management Editor.
   - Link the GPO to the appropriate OU.
   - Ensure the users' computers are part of the OU or have the GPO applied.
   - On the users' computers, run `gpupdate /force` to apply the policy immediately.

This setup will allow users to change their IP address without granting them full administrative rights.

Does this help, or do you need more details on any specific step?
