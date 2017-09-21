.class Lcom/boyaa/widget/BoyaaToast$BoyaaToastHolder;
.super Ljava/lang/Object;
.source "BoyaaToast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/widget/BoyaaToast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BoyaaToastHolder"
.end annotation


# static fields
.field public static mInstance:Lcom/boyaa/widget/BoyaaToast;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 12
    new-instance v0, Lcom/boyaa/widget/BoyaaToast;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/boyaa/widget/BoyaaToast;-><init>(Lcom/boyaa/widget/BoyaaToast;)V

    sput-object v0, Lcom/boyaa/widget/BoyaaToast$BoyaaToastHolder;->mInstance:Lcom/boyaa/widget/BoyaaToast;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
