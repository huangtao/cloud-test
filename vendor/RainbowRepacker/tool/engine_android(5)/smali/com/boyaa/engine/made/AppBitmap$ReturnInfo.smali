.class Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
.super Ljava/lang/Object;
.source "AppBitmap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppBitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReturnInfo"
.end annotation


# instance fields
.field public Pixels:[B

.field height:I

.field final synthetic this$0:Lcom/boyaa/engine/made/AppBitmap;

.field width:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppBitmap;)V
    .locals 0

    .prologue
    .line 249
    iput-object p1, p0, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->this$0:Lcom/boyaa/engine/made/AppBitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
