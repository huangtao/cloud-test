.class Lcom/boyaa/engine/device/GalleryImpl$1;
.super Ljava/lang/Object;
.source "GalleryImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/device/GalleryImpl;

.field private final synthetic val$flag:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/GalleryImpl;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/GalleryImpl$1;->this$0:Lcom/boyaa/engine/device/GalleryImpl;

    iput p2, p0, Lcom/boyaa/engine/device/GalleryImpl$1;->val$flag:I

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 54
    iget v0, p0, Lcom/boyaa/engine/device/GalleryImpl$1;->val$flag:I

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/GalleryImpl;->nativeEvent(ILjava/lang/String;)V

    .line 55
    return-void
.end method
