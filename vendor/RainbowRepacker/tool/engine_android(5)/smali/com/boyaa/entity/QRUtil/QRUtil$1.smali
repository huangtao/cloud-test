.class Lcom/boyaa/entity/QRUtil/QRUtil$1;
.super Ljava/lang/Object;
.source "QRUtil.java"

# interfaces
.implements Lcom/dtr/zxing/createQR/IQRCreatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/QRUtil/QRUtil;->createListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/QRUtil/QRUtil;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/QRUtil/QRUtil;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/QRUtil/QRUtil$1;->this$0:Lcom/boyaa/entity/QRUtil/QRUtil;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateQRCallBack(Z)V
    .locals 1
    .param p1, "isSuccess"    # Z

    .prologue
    .line 50
    iget-object v0, p0, Lcom/boyaa/entity/QRUtil/QRUtil$1;->this$0:Lcom/boyaa/entity/QRUtil/QRUtil;

    # invokes: Lcom/boyaa/entity/QRUtil/QRUtil;->responseCreateQR(Z)V
    invoke-static {v0, p1}, Lcom/boyaa/entity/QRUtil/QRUtil;->access$0(Lcom/boyaa/entity/QRUtil/QRUtil;Z)V

    .line 51
    return-void
.end method
