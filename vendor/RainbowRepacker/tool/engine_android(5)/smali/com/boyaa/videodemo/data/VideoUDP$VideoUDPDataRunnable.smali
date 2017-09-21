.class Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;
.super Ljava/lang/Object;
.source "VideoUDP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/VideoUDP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VideoUDPDataRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/VideoUDP;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/VideoUDP;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 137
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/data/VideoUDP;->access$4(Lcom/boyaa/videodemo/data/VideoUDP;Z)V

    .line 139
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    if-nez v1, :cond_2

    .line 158
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    if-nez v1, :cond_1

    .line 145
    const-string v1, "VideoUDP"

    const-string v2, "udp broken!!!"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :catch_0
    move-exception v1

    goto :goto_0

    .line 148
    :cond_1
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->receiveBuffer:[B
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoUDP;->access$6(Lcom/boyaa/videodemo/data/VideoUDP;)[B

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->receiveBuffer:[B
    invoke-static {v2}, Lcom/boyaa/videodemo/data/VideoUDP;->access$6(Lcom/boyaa/videodemo/data/VideoUDP;)[B

    move-result-object v2

    array-length v2, v2

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 149
    .local v0, "dp":Ljava/net/DatagramPacket;
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 151
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/boyaa/videodemo/data/VideoUDP;->CheckVideoData([B)V

    .line 153
    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 141
    .end local v0    # "dp":Ljava/net/DatagramPacket;
    :cond_2
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->isUDPDataRunning:Z
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoUDP;->access$5(Lcom/boyaa/videodemo/data/VideoUDP;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0
.end method
