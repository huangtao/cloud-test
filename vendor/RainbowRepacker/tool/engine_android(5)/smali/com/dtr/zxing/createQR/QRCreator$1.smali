.class Lcom/dtr/zxing/createQR/QRCreator$1;
.super Ljava/lang/Object;
.source "QRCreator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dtr/zxing/createQR/QRCreator;->createQR(Ljava/lang/String;ILjava/lang/String;Landroid/graphics/Bitmap;Lcom/dtr/zxing/createQR/IQRCreatorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dtr/zxing/createQR/QRCreator;

.field private final synthetic val$content:Ljava/lang/String;

.field private final synthetic val$imagePath:Ljava/lang/String;

.field private final synthetic val$listener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

.field private final synthetic val$logoBmp:Landroid/graphics/Bitmap;

.field private final synthetic val$sideLength:I


# direct methods
.method constructor <init>(Lcom/dtr/zxing/createQR/QRCreator;Ljava/lang/String;ILandroid/graphics/Bitmap;Ljava/lang/String;Lcom/dtr/zxing/createQR/IQRCreatorListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->this$0:Lcom/dtr/zxing/createQR/QRCreator;

    iput-object p2, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$content:Ljava/lang/String;

    iput p3, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$sideLength:I

    iput-object p4, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$logoBmp:Landroid/graphics/Bitmap;

    iput-object p5, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$imagePath:Ljava/lang/String;

    iput-object p6, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$listener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 41
    iget-object v1, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$content:Ljava/lang/String;

    iget v2, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$sideLength:I

    iget v3, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$sideLength:I

    .line 42
    iget-object v4, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$logoBmp:Landroid/graphics/Bitmap;

    .line 43
    iget-object v5, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$imagePath:Ljava/lang/String;

    .line 41
    invoke-static {v1, v2, v3, v4, v5}, Lcom/dtr/zxing/createQR/QRCodeUtil;->createQRImage(Ljava/lang/String;IILandroid/graphics/Bitmap;Ljava/lang/String;)Z

    move-result v0

    .line 45
    .local v0, "success":Z
    iget-object v1, p0, Lcom/dtr/zxing/createQR/QRCreator$1;->val$listener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    invoke-interface {v1, v0}, Lcom/dtr/zxing/createQR/IQRCreatorListener;->onCreateQRCallBack(Z)V

    .line 46
    return-void
.end method
