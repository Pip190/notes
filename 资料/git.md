## [生成新 SSH 密钥](https://docs.github.com/zh/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)

可在本地计算机上生成新的 SSH 密钥。 生成密钥后，可将公钥添加到 GitHub.com 上的帐户中，以便通过 SSH 为 Git 操作启用身份验证。

```
GitHub 通过在 2022 年 3 月 15 日删除旧的、不安全的密钥类型来提高安全性。

自该日期起，不再支持 DSA 密钥 (`ssh-dss`)。 无法在 GitHub 上向个人帐户添加新的 DSA 密钥。

2021 年 11 月 2 日之前带有 `valid_after` 的 RSA 密钥 (`ssh-rsa`) 可以继续使用任何签名算法。 在该日期之后生成的 RSA 密钥必须使用 SHA-2 签名算法。 一些较旧的客户端可能需要升级才能使用 SHA-2 签名。
```

1. 打开Git Bash。

2. 粘贴以下文本，将示例中使用的电子邮件替换为 GitHub 电子邮件地址。

   ```shell
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

   Note

   如果你使用的是不支持 Ed25519 算法的旧系统，请使用以下命令：

   ```shell
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   这将以提供的电子邮件地址为标签创建新 SSH 密钥。

   ```shell
   > Generating public/private ALGORITHM key pair.
   ```

   当系统提示您“Enter a file in which to save the key（输入要保存密钥的文件）”时，可以按 Enter 键接受默认文件位置。 请注意，如果以前创建了 SSH 密钥，则 ssh-keygen 可能会要求重写另一个密钥，在这种情况下，我们建议创建自定义命名的 SSH 密钥。 为此，请键入默认文件位置，并将 id_ALGORITHM 替换为自定义密钥名称。

   ```powershell
   > Enter file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]
   ```

3. 在提示符下，键入安全密码。 有关详细信息，请参阅“[使用 SSH 密钥密码](https://docs.github.com/zh/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases)”。

   ```shell
   > Enter passphrase (empty for no passphrase): [Type a passphrase]
   > Enter same passphrase again: [Type passphrase again]
   ```



### 报错问题：

```bash
ssh: connect to host github.com port 22: Connection timed out fatal: Could not read from remote repository. Please make sure you have the correct access rights and the repository exists.
```

### 解决方案：

1. **尝试使用 HTTPS 连接**： 如果 SSH 连接不通，可以切换到 HTTPS 协议。通过以下命令修改远程仓库 URL：

   ```bash
   git remote set-url origin https://github.com/用户名/仓库名.git
   ```

   之后，你就可以通过 HTTPS 方式拉取或推送代码了，不需要依赖 SSH 连接。

2. **使用 GitHub 提供的 SSH 端口 443** ： 如果你想继续使用 SSH，可以尝试通过端口 443 连接 GitHub，这通常不会被防火墙阻止。你可以通过修改 SSH 配置来实现：

   - 编辑或创建 SSH 配置文件 `~/.ssh/config`（如果文件不存在，可以新建一个），加入以下内容：

     ```bash
     Host github.com
       Hostname ssh.github.com
       Port 443
     ```

   - 然后再尝试使用 `ssh -T git@github.com` 进行连接。

3. **检查防火墙设置**： 如果你有权限修改网络配置，可以检查防火墙或路由器是否阻止了端口 22。如果是公司或学校的网络，你可能需要联系网络管理员进行配置。