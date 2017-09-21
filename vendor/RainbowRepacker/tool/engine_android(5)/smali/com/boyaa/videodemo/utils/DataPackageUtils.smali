.class public Lcom/boyaa/videodemo/utils/DataPackageUtils;
.super Ljava/lang/Object;
.source "DataPackageUtils.java"


# static fields
.field public static final PCK_LENGTH_SIZE:I = 0x4

.field private static final TAG:Ljava/lang/String; = "DataPackageUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse2DataPackage(Ljava/io/InputStream;Ljava/lang/String;I)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 4
    .param p0, "inStream"    # Ljava/io/InputStream;
    .param p1, "secretKey"    # Ljava/lang/String;
    .param p2, "iType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    const/4 v1, 0x0

    .line 28
    .local v1, "pos":I
    const-string v2, "DataPackageUtils"

    const-string v3, "start receive audio "

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    new-instance v0, Lcom/boyaa/videodemo/utils/ProtoBufParser;

    const/4 v2, 0x4

    const/4 v3, 0x1

    invoke-direct {v0, p0, v2, v3}, Lcom/boyaa/videodemo/utils/ProtoBufParser;-><init>(Ljava/io/InputStream;IZ)V

    .line 31
    .local v0, "parser":Lcom/boyaa/videodemo/utils/ProtoBufParser;
    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->getVideoMessage()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v2

    return-object v2
.end method
